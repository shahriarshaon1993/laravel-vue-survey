<script setup>
import PageComponent from "@/components/PageComponent.vue";
import { ref, computed, onMounted } from "vue";
import { useRoute } from "vue-router";
import axiosClient from "@/axios";

import { BarChart, LineChart, PieChart } from "vue-chart-3";
import { Chart, registerables } from "chart.js";

Chart.register(...registerables);

const route = useRoute();
const surveySlug = computed(() => route.params.slug);

const loading = ref(false);
const error = ref(null);
const report = ref({
    survey: null,
    timeline: {},
    questions: [],
    completion: null,
});

async function fetchReport() {
    loading.value = true;
    error.value = null;

    try {
        const { data } = await axiosClient.get(`/${surveySlug.value}/report`);
        report.value = data;
    } catch (e) {
        error.value = "Failed to load report";
        console.error(e);
    } finally {
        loading.value = false;
    }
}
onMounted(fetchReport);

// Helpers
const surveyInfo = computed(() => report.value?.survey ?? {});
const participants = computed(() => surveyInfo.value?.total_responses ?? 0);

const timelineChart = computed(() => {
    const labels = Object.keys(report.value?.timeline || {});
    const values = Object.values(report.value?.timeline || {});

    return {
        data: {
            labels,
            datasets: [
                {
                    label: "Responses",
                    data: values,
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
            scales: {
                x: { ticks: { autoSkip: true } },
                y: { beginAtZero: true },
            },
        },
    };
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
    <PageComponent>
        <template v-slot:header>
            <div>
                <h1 class="text-xl font-bold text-gray-900">Survey Report</h1>
                <p class="text-gray-700 text-sm">
                    Detailed analytics for a single survey.
                </p>
            </div>
        </template>

        <div v-if="loading" class="flex justify-center">Loading...</div>

        <template v-else>
            <!-- Summary cards -->
            <div
                class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-6"
            >
                <div class="rounded-2xl p-4 bg-white shadow">
                    <div class="text-sm text-gray-500">Title</div>
                    <div class="font-semibold">{{ surveyInfo.title }}</div>
                </div>

                <div class="rounded-2xl p-4 bg-white shadow">
                    <div class="text-sm text-gray-500">Status</div>
                    <div class="font-semibold">{{ surveyInfo.status }}</div>
                </div>

                <div class="rounded-2xl p-4 bg-white shadow">
                    <div class="text-sm text-gray-500">Expire Date</div>
                    <div class="font-semibold">
                        {{ surveyInfo.expire_date ?? "—" }}
                    </div>
                </div>

                <div class="rounded-2xl p-4 bg-white shadow">
                    <div class="text-sm text-gray-500">Total Responses</div>
                    <div class="font-semibold">{{ participants }}</div>
                </div>
            </div>

            <!-- Timeline -->
            <div class="rounded-2xl p-5 bg-white shadow mb-8">
                <div class="flex items-center justify-between mb-3">
                    <h2 class="text-lg font-semibold">
                        Participation Timeline
                    </h2>
                    <span class="text-sm text-gray-500">Daily responses</span>
                </div>

                <div>
                    <LineChart
                        v-if="Object.keys(report.timeline || {}).length"
                        :chartData="timelineChart.data"
                        :options="timelineChart.options"
                    />
                    <div v-else class="text-gray-500 text-sm">
                        No timeline data
                    </div>
                </div>
            </div>

            <!-- Questions -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-6">
                <div
                    v-for="q in report.questions"
                    :key="q.id"
                    class="rounded-2xl p-5 bg-white shadow"
                >
                    <div class="mb-2">
                        <div
                            class="text-sm text-gray-500 uppercase tracking-wide"
                        >
                            {{ q.type }}
                        </div>
                        <h3 class="text-lg font-semibold">{{ q.question }}</h3>
                    </div>

                    <!-- Text / Textarea: list -->
                    <div v-if="isText(q)" class="mt-3">
                        <div
                            v-if="(q.answers || []).length"
                            class="space-y-2 overflow-auto pr-2"
                        >
                            <div
                                v-for="(ans, i) in q.answers"
                                :key="i"
                                class="p-3 rounded border"
                            >
                                {{ ans }}
                            </div>
                        </div>
                        <div v-else class="text-gray-500 text-sm">
                            No answers
                        </div>
                    </div>

                    <!-- Choice: Pie for radio/select; Bar for checkbox -->
                    <div v-else-if="isChoice(q)" class="mt-3">
                        <div v-if="(q.answers || []).length">
                            <PieChart
                                v-if="!isCheckbox(q)"
                                :chartData="choiceChartFor(q).data"
                                :options="choiceChartFor(q).options"
                            />
                            <BarChart
                                v-else
                                :chartData="choiceChartFor(q).data"
                                :options="choiceChartFor(q).options"
                            />
                        </div>
                        <div v-else class="text-gray-500 text-sm">
                            No answers
                        </div>
                    </div>

                    <!-- Table under chart -->
                    <div
                        v-if="(q.answers || []).length"
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
                                    v-for="(row, i) in q.answers"
                                    :key="i"
                                    class="border-t"
                                >
                                    <td class="py-2 pr-4">
                                        {{ row.answer ?? "(empty)" }}
                                    </td>
                                    <td class="py-2 pr-4">{{ row.count }}</td>
                                    <td class="py-2 pr-4">
                                        {{ row.percentage }}%
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Numeric: stats -->
                    <div v-else-if="isNumeric(q)" class="mt-3">
                        <div
                            v-if="q.statistics"
                            class="grid grid-cols-1 sm:grid-cols-3 gap-3"
                        >
                            <div class="rounded-lg p-3 border">
                                <div class="text-xs text-gray-500">Min</div>
                                <div class="text-lg font-semibold">
                                    {{ q.statistics.min }}
                                </div>
                            </div>
                            <div class="rounded-lg p-3 border">
                                <div class="text-xs text-gray-500">Average</div>
                                <div class="text-lg font-semibold">
                                    {{ q.statistics.avg }}
                                </div>
                            </div>
                            <div class="rounded-lg p-3 border">
                                <div class="text-xs text-gray-500">Max</div>
                                <div class="text-lg font-semibold">
                                    {{ q.statistics.max }}
                                </div>
                            </div>
                        </div>
                        <div v-else class="text-gray-500 text-sm">
                            No numeric stats
                        </div>
                    </div>

                    <!-- Fallback -->
                    <div v-else class="text-gray-500 text-sm mt-3">
                        Unsupported question type
                    </div>
                </div>
            </div>

            <!-- Completion -->
            <div class="rounded-2xl p-5 bg-white shadow mt-8">
                <h2 class="text-lg font-semibold mb-2">Completion</h2>
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    <div class="rounded-lg p-4 border">
                        <div class="text-xs text-gray-500">Started</div>
                        <div class="text-xl font-semibold">
                            {{ report.completion?.started ?? 0 }}
                        </div>
                    </div>
                    <div class="rounded-lg p-4 border">
                        <div class="text-xs text-gray-500">Completed</div>
                        <div class="text-xl font-semibold">
                            {{ report.completion?.completed ?? 0 }}
                        </div>
                    </div>
                    <div class="rounded-lg p-4 border">
                        <div class="text-xs text-gray-500">Completion Rate</div>
                        <div class="text-xl font-semibold">
                            {{ report.completion?.completion_rate ?? 0 }}%
                        </div>
                    </div>
                </div>
            </div>
        </template>
    </PageComponent>
</template>
