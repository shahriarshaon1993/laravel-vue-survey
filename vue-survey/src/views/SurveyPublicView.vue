<script setup>
import { useStore } from "vuex";
import { useRoute } from "vue-router";
import { computed, ref, onMounted } from "vue";
import ArrowLeft from "@/components/icons/ArrowLeft.vue";
import ArrowRight from "@/components/icons/ArrowRight.vue";
import PrimaryLink from "@/components/PrimaryLink.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import QuestionViewer from "@/components/viewer/QuestionViewer.vue";

const route = useRoute();
const store = useStore();

const loading = computed(() => store.state.currentSurvey.loading);
const survey = computed(() => store.state.currentSurvey.data);

const isParticipated = ref(false);
const surveyFinished = ref(false);

const step = ref(0);
const answers = ref({});

const total = computed(() => survey.value?.questions?.length || 0);

const currentQuestion = computed(
    () => survey.value?.questions?.[step.value] || null
);

function isAnswered(q) {
    const val = answers.value[q.id];
    if (q?.data?.required) {
        if (q.type === "checkbox") return Array.isArray(val) && val.length > 0;
        return val !== undefined && val !== null && String(val).trim() !== "";
    }

    return true;
}

function next() {
    if (!currentQuestion.value) return;
    if (!isAnswered(currentQuestion.value)) return;
    if (step.value < total.value - 1) step.value++;
}

function prev() {
    if (step.value > 0) step.value--;
}

function submitSurvey() {
    store
        .dispatch("saveSurveyAnswer", {
            surveyId: survey.value.id,
            answers: answers.value,
        })
        .then((response) => {
            if (response.status === 201) {
                surveyFinished.value = true;
            }
        })
        .catch((error) => {
            if (error.status === 403) {
                isParticipated.value = true;
            }
        });
}

function submitAnotherResponse() {
    step.value = 0;
    answers.value = {};
    surveyFinished.value = false;
}

onMounted(() => store.dispatch("getSurveyBySlug", route.params.slug));
</script>

<template>
    <div class="flex flex-col items-center justify-center min-h-screen">
        <div
            v-if="isParticipated"
            class="bg-indigo-100 text-indigo-700 text-center text-xl lg:text-2xl py-3 px-8 rounded-md my-6"
        >
            You have already participated in this survey
        </div>
        <div
            v-if="surveyFinished"
            class="py-8 px-6 bg-gray-100 text-gray-900 w-[600px] mx-auto shadow-md rounded-md"
        >
            <div class="text-xl mb-3 font-semibold">
                Thank you for participating in this survey
            </div>
            <PrimaryLink
                :href="{ name: 'SurveysView' }"
                @click="submitAnotherResponse"
                class="px-6 py-3 rounded-md"
            >
                Submit another response
            </PrimaryLink>
        </div>

        <template v-else>
            <div v-if="loading" class="flex justify-center">Loading...</div>
            <div v-else class="w-full max-w-3xl">
                <form @submit.prevent="submitSurvey">
                    <div class="bg-gray-100 rounded-xl shadow-md">
                        <div class="text-center py-6">
                            <h1 class="text-3xl font-bold mb-3">
                                {{ survey.title }}
                            </h1>
                            <p
                                class="text-gray-600 text-sm"
                                v-html="survey.description"
                            ></p>
                        </div>

                        <div class="mb-6">
                            <div class="text-sm text-gray-600 text-center">
                                Question {{ step + 1 }} of {{ total }}
                            </div>
                            <div class="h-1 bg-gray-400 mt-2 overflow-hidden">
                                <div
                                    class="h-1 bg-gray-700 transition-all"
                                    :style="{
                                        width: ((step + 1) / total) * 100 + '%',
                                    }"
                                />
                            </div>
                        </div>

                        <div class="px-6 py-2">
                            <QuestionViewer
                                v-if="currentQuestion"
                                :key="currentQuestion.id"
                                v-model="answers[currentQuestion.id]"
                                :question="currentQuestion"
                                :index="step"
                            />
                        </div>
                    </div>

                    <div class="mt-3 flex justify-between">
                        <div>
                            <PrimaryButton
                                v-if="step !== 0"
                                type="button"
                                @click="prev"
                                class="px-5 py-3 rounded-md"
                            >
                                <ArrowLeft class="size-5" />
                                Previous
                            </PrimaryButton>
                        </div>

                        <div class="flex gap-2">
                            <PrimaryButton
                                v-if="step < total - 1"
                                type="button"
                                @click="next"
                                class="px-5 py-3 rounded-md"
                            >
                                Next
                                <ArrowRight class="size-5" />
                            </PrimaryButton>

                            <PrimaryButton
                                v-else
                                type="submit"
                                class="px-5 py-3 rounded-md"
                            >
                                Submit
                            </PrimaryButton>
                        </div>
                    </div>
                </form>
            </div>
        </template>
    </div>
</template>
