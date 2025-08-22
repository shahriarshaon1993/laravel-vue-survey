<script setup>
import ApplicationLogo from "@/components/icons/ApplicationLogo.vue";
import { useAuthentication } from "@/composables/useAuthentication";

const { isAdmin, isAuth } = useAuthentication();
</script>

<template>
    <nav class="border-gray-300 bg-gray-100 shadow">
        <div
            class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4"
        >
            <RouterLink
                to="#"
                class="flex items-center space-x-3 rtl:space-x-reverse"
            >
                <ApplicationLogo class="w-10 h-10 fill-current text-gray-500" />

                <span
                    class="self-center text-2xl font-semibold whitespace-nowrap"
                >
                    Surveyor
                </span>
            </RouterLink>

            <div class="w-full md:w-auto" id="navbar-solid-bg">
                <ul
                    class="flex flex-col font-medium mt-4 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-transparent"
                >
                    <li>
                        <RouterLink
                            v-if="isAdmin"
                            :to="{ name: 'Dashboard' }"
                            class="block py-2 px-3 md:p-0 text-gray-900 rounded-sm hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700"
                        >
                            Dashboard
                        </RouterLink>
                    </li>
                    <li>
                        <RouterLink
                            v-if="!isAuth"
                            :to="{ name: 'Login' }"
                            class="block py-2 px-3 md:p-0 text-gray-900 rounded-sm hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700"
                        >
                            Login
                        </RouterLink>
                    </li>
                    <li>
                        <RouterLink
                            v-if="!isAuth"
                            :to="{ name: 'Register' }"
                            class="block py-2 px-3 md:p-0 text-gray-900 rounded-sm hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700"
                        >
                            Register
                        </RouterLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>
