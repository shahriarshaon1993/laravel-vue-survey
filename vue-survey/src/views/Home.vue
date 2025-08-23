<script setup>
import PrimaryLink from "@/components/PrimaryLink.vue";
import IconChevronRight from "@/components/icons/ChevronRight.vue";

import { useAuthentication } from "@/composables/useAuthentication";

const { isAdmin, isAuth } = useAuthentication();
</script>

<template>
    <div class="min-h-screen">
        <div
            class="pt-8 lg:pt-36 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 relative text-center"
        >
            <h1
                class="max-w-2xl mx-auto text-center font-manrope font-bold text-4xl text-gray-900 mb-5 md:text-5xl leading-[50px]"
            >
                Control your Finances with our
                <span class="text-indigo-600">Smart Tool </span>
            </h1>
            <p
                class="max-w-sm mx-auto text-center text-base font-normal leading-7 text-gray-500 mb-12"
            >
                Invest intelligently and discover a better way to manage your
                entire wealth easily.
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
                :href="{ name: 'Register' }"
            >
                Surveys
                <IconChevronRight class="ml-2 h-5 w-5" />
            </PrimaryLink>
            <div class="flex justify-center mt-20">
                <img
                    src="https://pagedone.io/asset/uploads/1691054543.png"
                    alt="Dashboard image"
                    class="rounded-t-3xl h-auto object-cover"
                />
            </div>
        </div>
    </div>
</template>
