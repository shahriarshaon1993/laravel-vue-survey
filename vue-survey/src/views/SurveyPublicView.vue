<script setup>
import { computed, ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import { useStore } from "vuex";
import QuestionViewer from "@/components/viewer/QuestionViewer.vue";
import Card from "@/components/app/Card.vue";
import ArrowLeft from "@/components/icons/ArrowLeft.vue";
import ArrowRight from "@/components/icons/ArrowRight.vue";
import SurveyButton from "@/components/SurveyButton.vue";

const route = useRoute();
const store = useStore();

const loading = computed(() => store.state.currentSurvey.loading);
const survey = computed(() => store.state.currentSurvey.data);

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
    <div class="py-5 px-8">
        <template v-if="surveyFinished">
            <div
                class="py-8 px-6 bg-emerald-400 text-white w-[600px] mx-auto shadow-md rounded-md"
            >
                <div class="text-xl mb-3 font-semibold">
                    Thank you for participating in this survey
                </div>
                <button
                    @click="submitAnotherResponse"
                    type="button"
                    class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 foucs:outline-none foucs:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                >
                    Submit another response
                </button>
            </div>
        </template>

        <template v-else>
            <div v-if="loading" class="flex justify-center">Loading...</div>
            <form
                v-else
                @submit.prevent="submitSurvey"
                class="max-w-screen-md mx-auto"
            >
                <Card>
                    <div class="text-center">
                        <div class="max-w-md mx-auto py-4">
                            <h1 class="text-3xl mb-3">{{ survey.title }}</h1>
                            <p
                                class="text-gray-500 text-sm"
                                v-html="survey.description"
                            ></p>
                        </div>
                    </div>

                    <!-- Progress / Step info -->
                    <div class="mb-6">
                        <div class="text-sm text-gray-600 text-center">
                            Question {{ step + 1 }} of {{ total }}
                        </div>
                        <div class="h-1 bg-gray-100 mt-2 overflow-hidden">
                            <div
                                class="h-1 bg-[#F7BE38] transition-all"
                                :style="{
                                    width: ((step + 1) / total) * 100 + '%',
                                }"
                            />
                        </div>
                    </div>

                    <div>
                        <div class="px-5">
                            <QuestionViewer
                                v-if="currentQuestion"
                                :key="currentQuestion.id"
                                v-model="answers[currentQuestion.id]"
                                :question="currentQuestion"
                                :index="step"
                            />
                        </div>
                    </div>
                </Card>

                <div class="mt-3 flex justify-between">
                    <div>
                        <SurveyButton
                            v-if="step !== 0"
                            type="button"
                            @click="prev"
                        >
                            <ArrowLeft class="size-5" />
                            Previous
                        </SurveyButton>
                    </div>

                    <div class="flex gap-2">
                        <SurveyButton
                            v-if="step < total - 1"
                            type="button"
                            @click="next"
                        >
                            Next
                            <ArrowRight class="size-5" />
                        </SurveyButton>

                        <SurveyButton v-else type="submit">
                            Submit
                        </SurveyButton>
                    </div>
                </div>
            </form>
        </template>
    </div>
</template>
