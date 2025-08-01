<template>
    <div class="flex min-h-full items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="w-full max-w-md space-y-8">
            <div>
                <img class="mx-auto h-12 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
                    alt="Your Company" />
                <h2 class="mt-6 text-center text-3xl font-bold tracking-tight text-gray-900">Sign up for free
                </h2>
                <p class="mt-2 text-center text-sm text-gray-600">
                    Or
                    {{ ' ' }}
                    <router-link :to="{ name: 'Login' }" class="font-medium text-indigo-600 hover:text-indigo-500">
                        Login your account
                    </router-link>
                </p>
            </div>

            <Alert v-if="Object.keys(errors).length" class="flex-col items-stretch text-sm">
                <div v-for="(field, i) of Object.keys(errors)" :key="i">
                    <div v-for="(error, ind) of errors[field] || []" :key="ind">
                    * {{ error }}
                    </div>
                </div>
            </Alert>

            <form class="mt-8 space-y-6" @submit="register">
                <input type="hidden" name="remember" value="true" />
                <div class="-space-y-px rounded-md shadow-sm">
                    <div>
                        <label for="name" class="sr-only">Name</label>
                        <input id="name" type="text" v-model="user.name" autocomplete="name" required=""
                            class="relative block w-full appearance-none rounded-none rounded-t-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
                            placeholder="Your name" />
                    </div>
                    <div>
                        <label for="email-address" class="sr-only">Email address</label>
                        <input id="email-address" type="email" v-model="user.email" autocomplete="email" required=""
                            class="relative block w-full appearance-none rounded-none rounded-t-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
                            placeholder="Email address" />
                    </div>
                    <div>
                        <label for="password" class="sr-only">Password</label>
                        <input id="password" type="password" v-model="user.password" autocomplete="current-password"
                            required=""
                            class="relative block w-full appearance-none rounded-none rounded-b-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
                            placeholder="Password" />
                    </div>
                    <div>
                        <label for="password_confirmation" class="sr-only">Password Confirmation</label>
                        <input id="password_confirmation" type="password" autocomplete="current-password" required=""
                            v-model="user.password_confirmation"
                            class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                            placeholder="Password Confirmation" />
                    </div>
                </div>

                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="remember-me" name="remember-me" type="checkbox"
                            class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500" />
                        <label for="remember-me" class="ml-2 block text-sm text-gray-900">Remember me</label>
                    </div>

                    <div class="text-sm">
                        <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">Forgot your password?</a>
                    </div>
                </div>

                <div>
                    <button type="submit"
                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent
                        text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700
                        focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                        :class="{'cursor-not-allowed': loading, 'hover:bg-indigo-500': loading}"
                    >
                        <svg v-if="loading" class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        Sign up
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>

<script setup>
import Alert from '@/components/Alert.vue'
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useStore } from 'vuex';

const router = useRouter();
const store = useStore();

const user = {
    name: '',
    email: '',
    password: '',
    password_confirmation: ''
}

let loading = ref(false);
let errors = ref({});

function register(e) {
    e.preventDefault();
    loading.value = true;
    store.dispatch('register', user)
        .then(() => {
            loading.value = false;
            router.push({
                name: 'Dashboard'
            });
        })
        .catch(err => {
            loading.value = false;
            if (err.response.status === 422) {
                errors.value = err.response.data.errors;
            }
        });
}
</script>
