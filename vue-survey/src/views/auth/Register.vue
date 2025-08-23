<script setup>
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import InputLabel from "@/components/InputLabel.vue";
import TextInput from "@/components/TextInput.vue";
import InputError from "@/components/InputError.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import AnimateSpin from "@/components/icons/AnimateSpin.vue";

const router = useRouter();
const store = useStore();

const form = reactive({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
});

let loading = ref(false);
let errors = ref({});

const submit = (e) => {
    e.preventDefault();
    loading.value = true;
    store
        .dispatch("register", form)
        .then(() => {
            loading.value = false;
            router.push({
                name: "Dashboard",
            });
        })
        .catch((err) => {
            loading.value = false;
            if (err.response.status === 422) {
                errors.value = err.response.data.errors;
            }
        });
};
</script>

<template>
    <form @submit.prevent="submit">
        <div>
            <InputLabel for="name" value="Name" />

            <TextInput
                id="name"
                type="text"
                class="mt-1 block w-full"
                v-model="form.name"
                required
                autofocus
                autocomplete="name"
            />

            <InputError
                v-if="errors.name"
                class="mt-2"
                :message="errors.name[0]"
            />
        </div>

        <div class="mt-4">
            <InputLabel for="email" value="Email" />

            <TextInput
                id="email"
                type="email"
                class="mt-1 block w-full"
                v-model="form.email"
                required
                autocomplete="username"
            />

            <InputError
                v-if="errors.email"
                class="mt-2"
                :message="errors.email[0]"
            />
        </div>

        <div class="mt-4">
            <InputLabel for="password" value="Password" />

            <TextInput
                id="password"
                type="password"
                class="mt-1 block w-full"
                v-model="form.password"
                required
                autocomplete="new-password"
            />

            <InputError
                v-if="errors.password"
                class="mt-2"
                :message="errors.password[0]"
            />
        </div>

        <div class="mt-4">
            <InputLabel for="password_confirmation" value="Confirm Password" />

            <TextInput
                id="password_confirmation"
                type="password"
                class="mt-1 block w-full"
                v-model="form.password_confirmation"
                required
                autocomplete="new-password"
            />

            <InputError
                v-if="errors.password_confirmation"
                class="mt-2"
                :message="errors.password_confirmation[0]"
            />
        </div>

        <div class="flex items-center justify-end mt-4 gap-2">
            <RouterLink
                :to="{ name: 'Login' }"
                class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
                Already registered?
            </RouterLink>

            <PrimaryButton :disabled="loading" class="px-4 py-2 rounded">
                <AnimateSpin
                    v-if="loading"
                    class="-ml-1 mr-3 h-5 w-5 text-white"
                />
                Register
            </PrimaryButton>
        </div>
    </form>
</template>
