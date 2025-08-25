<script setup>
import PageComponent from "@/components/PageComponent.vue";
import SurveyListItem from "@/components/SurveyListItem.vue";
import { computed } from "vue";
import store from "@/store";
import PrimaryLink from "@/components/PrimaryLink.vue";
import Plus from "@/components/icons/Plus.vue";

const surveys = computed(() => store.state.surveys);

store.dispatch("getSurveys");

function deleteSurvey(survey) {
    if (
        confirm(
            `Are you sure you want to delete this survey? Operation can't be undone!!`
        )
    ) {
        store.dispatch("deleteSurvey", survey.id).then(() => {
            store.dispatch("getSurveys");
        });
    }
}

function getForPage(ev, link) {
    ev.preventDefault();
    if (!link.url || link.active) {
        return;
    }

    store.dispatch("getSurveys", { url: link.url });
}
</script>

<template>
    <PageComponent>
        <template v-slot:header>
            <div class="flex justify-between items-center">
                <h1 class="text-xl font-bold text-gray-900">Surveys</h1>
                <PrimaryLink
                    class="py-2 px-4 rounded-md"
                    :href="{ name: 'SurveyCreate' }"
                >
                    <Plus class="w-4 h-4 mr-2" />
                    Add Survey
                </PrimaryLink>
            </div>
        </template>

        <div v-if="surveys.loading" class="flex justify-center">Loading...</div>

        <template v-else>
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-3">
                <SurveyListItem
                    v-for="(survey, index) in surveys.data"
                    :key="survey.id"
                    :survey="survey"
                    @delete="deleteSurvey(survey)"
                    class="opacity-0 animate-fade-in-down"
                    :style="{ animationDelay: `${index * 0.1}s` }"
                />
            </div>

            <div class="flex justify-center mt-5">
                <nav
                    class="relative z-0 inline-flex justify-center rounded-md shadow-sm"
                    aria-label="Pagination"
                >
                    <a
                        v-for="(link, i) of surveys.links"
                        :key="i"
                        :disabled="!link.url"
                        href="#"
                        @click="getForPage($event, link)"
                        aria-current="page"
                        class="relative inline-flex items-center px-4 py-2 border text-sm font-medium whitespace-nowrap"
                        :class="[
                            link.active
                                ? 'z-10 bg-indigo-50 border-indigo-500 text-indigo-600'
                                : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-50',
                            i === 0 ? 'rounded-l-md' : '',
                            i === surveys.links.length - 1
                                ? 'rounded-r-md'
                                : '',
                        ]"
                        v-html="link.label"
                    >
                    </a>
                </nav>
            </div>
        </template>
    </PageComponent>
</template>
