<?php

namespace App\Http\Controllers;

use App\Models\Survey;
use Illuminate\Http\Request;

class SurveyReportController extends Controller
{
    public function show(Survey $survey)
    {
        // 1. Survey Info
        $surveyInfo = [
            'id' => $survey->id,
            'title' => $survey->title,
            'description' => $survey->description,
            'status' => $survey->status ? 'Active' : 'Inactive',
            'expire_date' => $survey->expire_date,
            'created_by' => $survey->user?->name,
            'total_responses' => $survey->answers()->count(),
        ];

        // User wise participation
        $userReports = $survey->answers()
            ->with(['user', 'answers.question'])
            ->get()->map(function ($answer) {
                return [
                    'user' => $answer->user ? $answer->user->only(['id', 'name', 'email']) : null,
                    'started_at' => $answer->start_date,
                    'completed_at' => $answer->end_date,
                    'responses' => $answer->answers->map(function ($a) {
                        return [
                            'question' => $a->question ? $a->question->question : null,
                            'type' => $a->question ? $a->question->type : null,
                            'answer' => $a->answer,
                        ];
                    }),
                ];
            });

        // Participation Timeline (daily count)
        $timeline = $survey->answers()
            ->selectRaw('DATE(start_date) as date, COUNT(*) as total')
            ->groupBy('date')
            ->pluck('total', 'date');

        // Question-wise Report
        $questions = $survey->questions()
            ->with('answers')
            ->get()->map(function ($q) {
                $report = [
                    'id' => $q->id,
                    'question' => $q->question,
                    'type' => $q->type
                ];

                if (in_array($q->type, ['text', 'textarea'])) {
                    $report['answers'] = $q->answers->pluck('answer');
                } elseif (in_array($q->type, ['radio', 'checkbox', 'select'])) {
                    $counts = $q->answers()
                        ->selectRaw('answer, COUNT(*) as total')
                        ->groupBy('answer')
                        ->pluck('total', 'answer');

                    $total = $counts->sum();

                    $report['answers'] = $counts->map(function ($count, $answer) use ($total) {
                        return [
                            'answer' => $answer,
                            'count' => $count,
                            'percentage' => round(($count / $total) * 100, 2)
                        ];
                    })->values();
                } elseif (in_array($q->type, ['number', 'rating'])) {
                    // Numeric answers → avg, min, max
                    $report['statistics'] = [
                        'min' => $q->answers()->min('answer'),
                        'max' => $q->answers()->max('answer'),
                        'avg' => round($q->answers()->avg('answer'), 2),
                    ];
                }

                return $report;
            });

        // Completion Report
        $completion = [
            'started' => $survey->answers()->count(),
            'completed' => $survey->answers()->whereNotNull('end_date')->count(),
        ];

        $completion['completion_rate'] = $completion['started'] > 0
            ? round(($completion['completed'] / $completion['started']) * 100, 2)
            : 0;

        // Final Response
        return response()->json([
            'survey' => $surveyInfo,
            'timeline' => $timeline,
            'questions' => $questions,
            'completion' => $completion,
            'user_reports' => $userReports,
        ]);
    }
}
