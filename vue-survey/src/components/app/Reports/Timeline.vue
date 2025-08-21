<script setup>
import { computed } from "vue";
import Card from "@/components/app/Card.vue";
import { LineChart } from "vue-chart-3";

const props = defineProps({
    timeline: Object,
});

const timelineChart = computed(() => {
    const labels = Object.keys(props?.timeline || {});
    const values = Object.values(props?.timeline || {});

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
</script>

<template>
    <Card class="p-4">
        <div class="flex items-center justify-between mb-3">
            <h2 class="text-lg font-semibold">Participation Timeline</h2>
            <span class="text-sm text-gray-500">Daily responses</span>
        </div>

        <div>
            <LineChart
                v-if="Object.keys(timeline || {}).length"
                :chartData="timelineChart.data"
                :options="timelineChart.options"
            />
            <div v-else class="text-gray-500 text-sm">No timeline data</div>
        </div>
    </Card>
</template>
