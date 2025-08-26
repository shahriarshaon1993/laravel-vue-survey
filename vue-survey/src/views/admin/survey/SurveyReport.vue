<script setup>
import TimelineReport from "@/components/app/Reports/Timeline.vue";
import QuestionReport from "@/components/app/Reports/Question.vue";
import CompletionReport from "@/components/app/Reports/Completion.vue";
import SummaryCard from "@/components/app/Reports/SummaryCard.vue";
import PageComponent from "@/components/PageComponent.vue";
import { ref, computed, onMounted } from "vue";
import { useRoute } from "vue-router";
import axiosClient from "@/axios";

const route = useRoute();
const surveySlug = computed(() => route.params.slug);

const loading = ref(false);
const error = ref(null);
const report = ref({
    survey: null,
    timeline: {},
    questions: [],
    completion: null,
    user_reports: [],
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
                <SummaryCard
                    title="Title"
                    class="animate-fade-in-down"
                    style="animation-delay: 0.1s"
                >
                    <div class="font-semibold">{{ surveyInfo.title }}</div>
                </SummaryCard>

                <SummaryCard
                    title="Status"
                    class="animate-fade-in-down"
                    style="animation-delay: 0.2s"
                >
                    <div class="font-semibold">{{ surveyInfo.status }}</div>
                </SummaryCard>

                <SummaryCard
                    title="Expire Date"
                    class="animate-fade-in-down"
                    style="animation-delay: 0.3s"
                >
                    <div class="font-semibold">
                        {{ surveyInfo.expire_date ?? "—" }}
                    </div>
                </SummaryCard>

                <SummaryCard
                    title="Total Responses"
                    class="animate-fade-in-down p-4"
                    style="animation-delay: 0.4s"
                >
                    <div class="font-semibold">{{ participants }}</div>
                </SummaryCard>
            </div>

            <!-- Timeline -->
            <TimelineReport
                :timeline="report.timeline"
                class="animate-fade-in-down mb-6"
                style="animation-delay: 0.5s"
            />

            <!-- Questions -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-6">
                <QuestionReport
                    v-for="question in report.questions"
                    :key="question.id"
                    :question="question"
                    class="animate-fade-in-down"
                    style="animation-delay: 0.6s"
                />
            </div>

            <!-- Completion -->
            <CompletionReport :completion="report.completion" />
        </template>
    </PageComponent>
</template>
