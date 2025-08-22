<script setup>
import store from "../../store";
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import AnimateSpin from "@/components/icons/AnimateSpin.vue";
import InputLabel from "@/components/InputLabel.vue";
import TextInput from "@/components/TextInput.vue";
import InputError from "@/components/InputError.vue";
import Checkbox from "@/components/Checkbox.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";

const router = useRouter();

const form = reactive({
    email: "",
    password: "",
    remember: false,
});

let loading = ref(false);
let errorMsg = ref({});
let status = ref("");

const submit = (ev) => {
    ev.preventDefault();
    loading.value = true;
    store
        .dispatch("login", form)
        .then((res) => {
            loading.value = false;
            router.push({
                name: "Dashboard",
            });
        })
        .catch((err) => {
            loading.value = false;
            errorMsg.value = err.response.data.errors ?? {};
            status.value = err.response.data.error ?? "";
        });
};
</script>

<template>
    <div>
        <div v-if="status" class="mb-4 font-medium text-sm text-green-600">
            {{ status }}
        </div>

        <form @submit.prevent="submit">
            <div>
                <InputLabel for="email" value="Email" />

                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autofocus
                    autocomplete="username"
                />

                <InputError
                    v-if="errorMsg.email"
                    class="mt-2"
                    :message="errorMsg.email[0]"
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
                    autocomplete="current-password"
                />

                <InputError
                    v-if="errorMsg.password"
                    class="mt-2"
                    :message="errorMsg.password[0]"
                />
            </div>

            <div class="block mt-4">
                <label class="flex items-center">
                    <Checkbox name="remember" v-model:checked="form.remember" />
                    <span class="ml-2 text-sm text-gray-600">Remember me</span>
                </label>
            </div>

            <div class="flex items-center justify-end mt-4">
                <PrimaryButton class="ml-4" :disabled="loading">
                    <AnimateSpin
                        v-if="loading"
                        class="-ml-1 mr-3 h-5 w-5 text-white"
                    />
                    Log in
                </PrimaryButton>
            </div>
        </form>
    </div>
</template>
