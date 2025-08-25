<?php

use App\Http\Controllers\SurveyReportController;
use App\Http\Controllers\UserController;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SurveyController;
use App\Http\Controllers\DashboardController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me', function (Request $request) {
        return new UserResource($request->user());
    });

    Route::middleware('role:admin')->group(function () {
        Route::get('/dashboard', [DashboardController::class, 'index']);

        Route::resource('/survey', SurveyController::class);
        Route::get('/{survey:slug}/report', [SurveyReportController::class, 'show']);

        Route::get('/users', [UserController::class, 'index']);
        Route::delete('/users/{user}', [UserController::class, 'destroy']);
    });

    Route::get('/surveys', [SurveyController::class, 'publicSurveys']);
    Route::get('/survey-by-slug/{survey:slug}', [SurveyController::class, 'showForGuest']);
    Route::post('/survey/{survey}/answer', [SurveyController::class, 'storeAnswer']);

    Route::post('/logout', [AuthController::class, 'logout']);
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
