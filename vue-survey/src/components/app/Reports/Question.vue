<script setup>
import Card from "@/components/app/Card.vue";
import { BarChart, PieChart } from "vue-chart-3";

defineProps({
    question: Object,
});

function isText(q) {
    return ["text", "textarea"].includes(q.type);
}
function isChoice(q) {
    return ["radio", "select", "checkbox"].includes(q.type);
}
function isNumeric(q) {
    return ["number", "rating"].includes(q.type);
}

function choiceChartFor(q) {
    const labels = (q.answers || []).map((a) => a.answer ?? "(empty)");
    const counts = (q.answers || []).map((a) => a.count ?? 0);
    return {
        data: {
            labels,
            datasets: [
                {
                    label: "Count",
                    data: counts,
                    backgroundColor: [
                        "#77CEFF",
                        "#0079AF",
                        "#123E6B",
                        "#97B0C4",
                        "#A5C8ED",
                    ],
                },
            ],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: true } },
            scales: isCheckbox(q) ? { x: { beginAtZero: true } } : undefined,
        },
    };
}

function isCheckbox(q) {
    return q.type === "checkbox";
}
</script>

<template>
    <Card class="p-4">
        <div class="mb-2">
            <div class="text-sm text-gray-500 uppercase tracking-wide">
                {{ question.type }}
            </div>
            <h3 class="text-lg font-semibold">{{ question.question }}</h3>
        </div>

        <!-- Text / Textarea: list -->
        <div v-if="isText(question)" class="mt-3">
            <div
                v-if="(question.answers || []).length"
                class="space-y-2 overflow-auto pr-2"
            >
                <div
                    v-for="(ans, i) in question.answers"
                    :key="i"
                    class="p-3 rounded border"
                >
                    {{ ans }}
                </div>
            </div>
            <div v-else class="text-gray-500 text-sm">No answers</div>
        </div>

        <!-- Choice: Pie for radio/select; Bar for checkbox -->
        <div v-else-if="isChoice(question)" class="mt-3">
            <div v-if="(question.answers || []).length">
                <PieChart
                    v-if="!isCheckbox(question)"
                    :chartData="choiceChartFor(question).data"
                    :options="choiceChartFor(question).options"
                />
                <BarChart
                    v-else
                    :chartData="choiceChartFor(question).data"
                    :options="choiceChartFor(question).options"
                />
            </div>
            <div v-else class="text-gray-500 text-sm">No answers</div>
        </div>

        <!-- Table under chart -->
        <div
            v-if="(question.answers || []).length"
            class="mt-4 overflow-x-auto"
        >
            <table class="min-w-full text-sm">
                <thead>
                    <tr class="text-left text-gray-500">
                        <th class="py-2 pr-4">Answer</th>
                        <th class="py-2 pr-4">Count</th>
                        <th class="py-2 pr-4">%</th>
                    </tr>
                </thead>
                <tbody>
                    <tr
                        v-for="(row, i) in question.answers"
                        :key="i"
                        class="border-t"
                    >
                        <td class="py-2 pr-4">
                            {{ row.answer ?? "(empty)" }}
                        </td>
                        <td class="py-2 pr-4">{{ row.count }}</td>
                        <td class="py-2 pr-4">{{ row.percentage }}%</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Numeric: stats -->
        <div v-else-if="isNumeric(question)" class="mt-3">
            <div
                v-if="question.statistics"
                class="grid grid-cols-1 sm:grid-cols-3 gap-3"
            >
                <div class="rounded-lg p-3 border">
                    <div class="text-xs text-gray-500">Min</div>
                    <div class="text-lg font-semibold">
                        {{ question.statistics.min }}
                    </div>
                </div>
                <div class="rounded-lg p-3 border">
                    <div class="text-xs text-gray-500">Average</div>
                    <div class="text-lg font-semibold">
                        {{ question.statistics.avg }}
                    </div>
                </div>
                <div class="rounded-lg p-3 border">
                    <div class="text-xs text-gray-500">Max</div>
                    <div class="text-lg font-semibold">
                        {{ question.statistics.max }}
                    </div>
                </div>
            </div>
            <div v-else class="text-gray-500 text-sm">No numeric stats</div>
        </div>

        <!-- Fallback -->
        <div v-else class="text-gray-500 text-sm mt-3">
            Unsupported question type
        </div>
    </Card>
</template>
