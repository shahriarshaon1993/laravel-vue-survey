<script setup>
import PrimaryLink from "@/components/PrimaryLink.vue";
import IconChevronRight from "@/components/icons/ChevronRight.vue";
import SurveyImage from "@/assets/images/survey.png";

import { useAuthentication } from "@/composables/useAuthentication";

const { isAdmin, isAuth } = useAuthentication();
</script>

<template>
    <div class="min-h-screen">
        <div
            class="pt-8 lg:pt-36 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 relative text-center"
        >
            <h1
                class="max-w-4xl mx-auto text-center font-manrope font-bold text-4xl text-gray-900 mb-5 md:text-5xl leading-[50px]"
            >
                Analyze Responses and Understand Your
                <span class="text-indigo-600">Audience Better</span>
            </h1>
            <p
                class="max-w-md mx-auto text-center text-base font-normal leading-7 text-gray-500 mb-12"
            >
                Make surveys interactive and user-friendly by offering multiple
                formats. This ensures participants can respond easily, leading
                to higher engagement.
            </p>
            <PrimaryLink
                v-if="!isAuth"
                class="rounded-full px-6 py-3"
                :href="{ name: 'Register' }"
            >
                Create an account
                <IconChevronRight class="ml-2 h-5 w-5" />
            </PrimaryLink>
            <PrimaryLink
                v-else
                class="rounded-full px-6 py-3"
                :href="{ name: 'SurveysView' }"
            >
                Surveys
                <IconChevronRight class="ml-2 h-5 w-5" />
            </PrimaryLink>
            <div class="flex justify-center mt-20">
                <img
                    :src="SurveyImage"
                    alt="Dashboard image"
                    class="rounded-t-3xl h-auto object-cover"
                />
            </div>
        </div>
    </div>
</template>
