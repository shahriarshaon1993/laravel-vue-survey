<script setup>
import Card from "@/components/app/Card.vue";
import IconEdit from "@/components/icons/Edit.vue";
import PrimaryLink from "@/components/PrimaryLink.vue";
import SeconderyLink from "@/components/SeconderyLink.vue";
import PageComponent from "@/components/PageComponent.vue";
import { computed } from "vue";
import { useStore } from "vuex";
import IconEye from "@/components/icons/Eye.vue";

const store = useStore();

const loading = computed(() => store.state.dashboard.loading);
const data = computed(() => store.state.dashboard.data);

store.dispatch("getDashboardData");
</script>

<template>
    <PageComponent title="Dashboard">
        <div v-if="loading" class="flex justify-center">Loading...</div>
        <div
            v-else
            class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 text-gray-700"
        >
            <Card
                class="p-3 text-center flex flex-col animate-fade-in-down order-1 lg:order-2"
                style="animation-delay: 0.1s"
            >
                <h3 class="text-2xl font-semibold">Total Surveys</h3>
                <div
                    class="text-8xl font-semibold flex-1 flex items-center justify-center"
                >
                    {{ data.totalSurveys }}
                </div>
            </Card>

            <Card
                class="p-3 text-center flex flex-col animate-fade-in-down order-2 lg:order-4"
                style="animation-delay: 0.2s"
            >
                <h3 class="text-2xl font-semibold">Total Answers</h3>
                <div
                    class="text-8xl font-semibold flex-1 flex items-center justify-center"
                >
                    {{ data.totalAnswers }}
                </div>
            </Card>

            <Card
                class="row-span-2 order-3 lg:order-1 p-4 animate-fade-in-down space-y-3"
                style="animation-delay: 0.3s"
            >
                <h3 class="text-2xl font-semibold">Latest Surveys</h3>
                <div class="w-full relative h-auto">
                    <img
                        :src="data.latestSurvey.image_url"
                        alt="Image"
                        class="w-full max-w-full h-auto rounded-xl"
                    />
                </div>

                <h3 class="font-bold text-xl">
                    {{ data.latestSurvey.title }}
                </h3>

                <div class="space-y-1">
                    <div class="flex justify-between text-sm">
                        <div>Create date:</div>
                        <div>{{ data.latestSurvey.created_at }}</div>
                    </div>

                    <div class="flex justify-between text-sm">
                        <div>Expire date:</div>
                        <div>{{ data.latestSurvey.expire_date }}</div>
                    </div>

                    <div class="flex justify-between text-sm">
                        <div>Status:</div>
                        <div
                            class="bg-purple-400 text-white text-xs py-1 px-2 rounded-md"
                        >
                            {{ data.latestSurvey.status ? "Active" : "Draft" }}
                        </div>
                    </div>

                    <div class="flex justify-between text-sm">
                        <div>Questions:</div>
                        <div>{{ data.latestSurvey.questions }}</div>
                    </div>

                    <div class="flex justify-between text-sm">
                        <div>Answers:</div>
                        <div>{{ data.latestSurvey.answers }}</div>
                    </div>
                </div>

                <div class="flex justify-between">
                    <PrimaryLink
                        :href="{
                            name: 'SurveyView',
                            params: { id: data.latestSurvey.id },
                        }"
                    >
                        <IconEdit class="h-5 w-5 mr-2" />
                        Edit
                    </PrimaryLink>

                    <SeconderyLink
                        :href="{
                            name: 'SurveyReport',
                            params: { slug: data.latestSurvey.slug },
                        }"
                    >
                        <IconEye class="h-5 w-5 mr-2" />
                        View
                    </SeconderyLink>
                </div>
            </Card>

            <Card
                class="p-3 row-span-2 order-4 lg:order-3 animate-fade-in-down"
            >
                <div class="flex justify-between items-center mb-3 px-2">
                    <h3 class="text-2xl font-semibold">Latest Answers</h3>
                </div>

                <a
                    href="#"
                    v-for="answer of data.latestAnswers"
                    :key="answer.id"
                    class="block p-2 hover:bg-gray-100/90"
                >
                    <div class="font-semibold">{{ answer.survey.title }}</div>
                    <small>
                        Answer made at:
                        <i class="font-semibold">{{ answer.end_date }}</i>
                    </small>
                </a>
            </Card>
        </div>
    </PageComponent>
</template>
