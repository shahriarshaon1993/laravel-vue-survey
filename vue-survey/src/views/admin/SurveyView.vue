<script setup>
import PageComponent from "@/components/PageComponent.vue";
import QuestionEditor from "@/components/editor/QuestionEditor.vue";
import store from "../../store";
import { v4 as uuidv4 } from "uuid";
import { computed, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import DangerButton from "@/components/DangerButton.vue";
import Trash from "@/components/icons/Trash.vue";
import Image from "@/components/icons/Image.vue";
import SeconderyButton from "@/components/SeconderyButton.vue";
import TextInput from "@/components/TextInput.vue";
import InputLabel from "@/components/InputLabel.vue";
import InputError from "@/components/InputError.vue";
import PrimaryLink from "@/components/PrimaryLink.vue";
import ArrowLeft from "@/components/icons/ArrowLeft.vue";
import TextareaInput from "@/components/TextareaInput.vue";
import Checkbox from "@/components/Checkbox.vue";
import Plus from "@/components/icons/Plus.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import AnimateSpin from "@/components/icons/AnimateSpin.vue";

const router = useRouter();
const route = useRoute();

const surveyLoading = computed(() => store.state.currentSurvey.loading);

const loading = ref(false);

// create empty survey
const model = ref({
    title: "",
    status: false,
    expire_date: "",
    description: null,
    image_url: null,
    questions: [],
});

// Watch to current survey data change and when this happens we update local
watch(
    () => store.state.currentSurvey.data,
    (newVal, oldVal) => {
        model.value = {
            ...JSON.parse(JSON.stringify(newVal)),
            status: newVal.status !== "draft",
        };
    }
);

if (route.params.id) {
    store.dispatch("getSurvey", route.params.id);
}

const onImageChoose = (ev) => {
    const file = ev.target.files[0];
    const reader = new FileReader();

    reader.onload = () => {
        // The filed to send on backend and apply validations
        model.value.image = reader.result;

        // The filed to display here
        model.value.image_url = reader.result;
    };
    reader.readAsDataURL(file);
};

const addQuestion = (index) => {
    const newQuestion = {
        id: uuidv4(),
        type: "text",
        question: "",
        description: null,
        data: {},
    };

    model.value.questions.splice(index, 0, newQuestion);
};

const deleteQuestion = (question) => {
    model.value.questions = model.value.questions.filter((q) => q !== question);
};

const questionChange = (question) => {
    model.value.questions = model.value.questions.map((q) => {
        if (q.id === question.id) {
            return JSON.parse(JSON.stringify(question));
        }

        return q;
    });
};

const saveSurvey = () => {
    store.dispatch("saveSurvey", model.value).then(({ data }) => {
        store.commit("notify", {
            type: "success",
            message: "Survey was successfully updated",
        });
        loading.value = false;
        router.push({
            name: "SurveyView",
            params: { id: data.data.id },
        });
    });
};

const deleteSurvey = () => {
    if (confirm(`Are you sure you want to delete this survey ?`)) {
        store.dispatch("deleteSurvey", model.value.id).then(() => {
            router.push({
                name: "Surveys",
            });
        });
    }
};
</script>

<template>
    <PageComponent>
        <template v-slot:header>
            <div class="flex items-center justify-between">
                <h1 class="text-xl font-bold text-gray-900">
                    {{ route.params.id ? model.title : "Create a survey" }}
                </h1>
                <DangerButton
                    v-if="route.params.id"
                    type="button"
                    @click="deleteSurvey()"
                >
                    <Trash class="w-4 h-4 mt-[1px] mr-1 inline-block" />
                    Delete Survey
                </DangerButton>

                <PrimaryLink
                    class="py-2 px-4 rounded-md"
                    v-else
                    :href="{ name: 'Surveys' }"
                >
                    Surveys
                </PrimaryLink>
            </div>
        </template>

        <div v-if="surveyLoading" class="flex justify-center">Loading...</div>

        <form v-else @submit.prevent="saveSurvey" class="animate-fade-in-down">
            <div class="shadow sm:rounded-md sm:overflow-hidden">
                <!-- Survey Field -->
                <div class="px-4 py-5 bg-white space-y-6 sm:p-6">
                    <!-- Image -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700">
                            Image
                        </label>
                        <div class="mt-1 flex items-center">
                            <img
                                v-if="model.image_url"
                                :src="model.image_url"
                                :alt="model.title"
                                class="w-64 h-48 object-cover"
                            />
                            <span
                                v-else
                                class="flex items-center justify-center h-16 w-16 rounded-full overflow-hidden bg-gray-100"
                            >
                                <Image class="h-[80%] w-[80%] text-gray-300" />
                            </span>

                            <SeconderyButton
                                class="relative overflow-hidden ml-3"
                            >
                                <input
                                    type="file"
                                    @change="onImageChoose"
                                    class="absolute left-0 top-0 right-0 bottom-0 opacity-0 cursor-pointer"
                                />
                                Upload
                            </SeconderyButton>
                        </div>
                    </div>
                    <!--/. Image -->

                    <!-- Title -->
                    <div>
                        <InputLabel for="title" value="Title" />

                        <TextInput
                            id="title"
                            type="text"
                            class="mt-1 block w-full"
                            v-model="model.title"
                            required
                            autofocus
                            autocomplete="survey_title"
                        />
                    </div>
                    <!--/. Title -->

                    <!--Description-->
                    <div>
                        <InputLabel for="description" value="Description" />

                        <TextareaInput
                            id="description"
                            type="text"
                            class="mt-1 block w-full"
                            v-model="model.description"
                        />
                    </div>
                    <!--/.Description-->

                    <!--Expire date-->
                    <div>
                        <InputLabel for="expire_date" value="Expire date" />

                        <TextInput
                            id="expire_date"
                            type="date"
                            class="mt-1 block w-full"
                            v-model="model.expire_date"
                        />
                    </div>
                    <!--/.Expire date-->

                    <!--Status-->
                    <div>
                        <label class="flex items-center">
                            <Checkbox
                                name="status"
                                v-model:checked="model.status"
                                class="h-4 w-4"
                            />
                            <span class="ml-2 text-sm text-gray-600"
                                >Active</span
                            >
                        </label>
                    </div>
                    <!--/.Status-->
                </div>
                <!--/. Survey Field -->

                <div class="px-4 py-5 bg-white space-y-6 sm:p-6">
                    <h3
                        class="text-2xl font-semibold flex items-center justify-between"
                    >
                        Questions

                        <SeconderyButton type="button" @click="addQuestion">
                            <Plus class="h-4 w-4 mr-1" />
                            Add Question
                        </SeconderyButton>
                    </h3>

                    <div
                        v-if="!model.questions.length"
                        class="text-center text-gray-600"
                    >
                        You don't have any question created
                    </div>

                    <div
                        v-for="(question, index) in model.questions"
                        :key="question.id"
                    >
                        <QuestionEditor
                            :index="index"
                            :question="question"
                            @change="questionChange"
                            @addQuestion="addQuestion"
                            @deleteQuestion="deleteQuestion"
                        />
                    </div>
                </div>
                <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                    <PrimaryButton
                        class="py-2 px-4 rounded-md"
                        type="submit"
                        :disabled="loading"
                    >
                        <AnimateSpin
                            v-if="loading"
                            class="-ml-1 mr-3 h-5 w-5 text-white"
                        />
                        Save
                    </PrimaryButton>
                </div>
            </div>
        </form>
    </PageComponent>
</template>
