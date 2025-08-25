<script setup>
import IconBar from "@/components/icons/Bar.vue";
import PrimaryLink from "@/components/PrimaryLink.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import SeconderyLink from "@/components/SeconderyLink.vue";
import ApplicationLogo from "@/components/icons/ApplicationLogo.vue";

import store from "@/store";
import { useAuthentication } from "@/composables/useAuthentication";

const { isAdmin, isAuth } = useAuthentication();

function logout() {
    store.dispatch("logout").then(() => {
        router.push({
            name: "Home",
        });
    });
}
</script>

<template>
    <nav
        class="py-5 border-b-default border-solid border-gray-200 z-20 w-full bg-inherit lg:fixed"
    >
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div class="w-full flex flex-col lg:flex-row">
                <div class="flex justify-between lg:flex-row">
                    <a href="/" class="flex items-center">
                        <ApplicationLogo
                            class="w-8 h-8 fill-current text-gray-900"
                        />
                        <span class="self-center text-3xl ml-2 font-bold">
                            Surveyor
                        </span>
                    </a>

                    <button
                        data-collapse-toggle="navbar"
                        type="button"
                        class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
                        aria-controls="navbar-default"
                        aria-expanded="false"
                    >
                        <span class="sr-only">Open main menu</span>
                        <IconBar class="w-6 h-6" />
                    </button>
                </div>
                <div class="hidden w-full lg:flex lg:pl-11 max-lg:py-4">
                    <ul
                        class="flex lg:items-center flex-col max-lg:gap-4 mt-4 lg:mt-0 lg:flex-row max-lg:mb-4"
                    >
                        <li v-if="isAdmin">
                            <RouterLink
                                :to="{ name: 'Dashboard' }"
                                class="text-gray-500 text-base lg:text-base font-medium hover:text-indigo-700 transition-all duration-500 mb-2 block lg:mr-6 md:mb-0 lg:text-left"
                            >
                                Dashboard
                            </RouterLink>
                        </li>
                        <li v-if="isAuth">
                            <RouterLink
                                :to="{ name: 'SurveysView' }"
                                class="text-gray-500 text-base lg:text-base font-medium hover:text-indigo-700 transition-all duration-500 mb-2 block lg:mr-6 md:mb-0 lg:text-left"
                            >
                                Surveys
                            </RouterLink>
                        </li>
                    </ul>
                    <div
                        class="flex lg:items-center justify-start flex-col lg:flex-row lg:gap-4 lg:flex-1 lg:justify-end"
                    >
                        <SeconderyLink
                            v-if="!isAuth"
                            :href="{ name: 'Login' }"
                            class="rounded-full py-3 px-6"
                        >
                            Login
                        </SeconderyLink>
                        <PrimaryLink
                            v-if="!isAuth"
                            :href="{ name: 'Register' }"
                            class="rounded-full py-3 px-6"
                        >
                            Sign up
                        </PrimaryLink>
                        <PrimaryButton
                            type="button"
                            v-if="isAuth"
                            :href="{ name: 'Register' }"
                            class="rounded-full py-3 px-6"
                            @click="logout"
                        >
                            Sign out
                        </PrimaryButton>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</template>
