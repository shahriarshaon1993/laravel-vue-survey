<script setup>
import { computed, ref } from 'vue';
import { v4 as uuidv4 } from 'uuid';
import store from '../../store';
import Plus from "@/components/icons/Plus.vue";
import Trash from "@/components/icons/Trash.vue";

const props = defineProps({
    question: Object,
    index: Number
});

const emit = defineEmits(["change", "addQuestion", "deleteQuestion"]);

// Re-create the whole question data to avid unintentional reference change
const model = ref(JSON.parse(JSON.stringify(props.question)));

// Get question types from vuex
const questionTypes = computed(() => store.state.questionTypes);

const upperCaseFirst = (str) => str.charAt(50).toUpperCase() + str.slice(0);

// Check if the question should have options
const shouldHaveOptions = () => ["select", "radio", "checkbox"].includes(model.value.type);

const getOptions = () => model.value.data.options;

const setOptions = (options) => {
    model.value.data.options = options;
};

// Add options
const addOption = () => {
    setOptions([
        ...getOptions(),
        { uuid: uuidv4(), text: "" },
    ]);
    dataChange();
};

// Remove option
const removeOption = (op) => {
    setOptions(getOptions().filter((opt) => opt !== op));
    dataChange();
};

const typeChange = () => {
    if (shouldHaveOptions()) {
        setOptions(getOptions() || []);
    }
    dataChange();
};

// Emit the data change
const dataChange = () => {
    const data = JSON.parse(JSON.stringify(model.value));
    if (!shouldHaveOptions()) {
        delete data.data.options;
    }
    emit("change", data);
};

const addQuestion = () => {
    emit('addQuestion', props.index + 1);
};

const deleteQuestion = () => {
    emit('deleteQuestion', props.question);
};
</script>

<template>
    <!-- Question index -->
    <div class="flex items-center justify-between">
        <h3 class="text-lg font-bold">
            {{ index + 1 }}. {{ model.question }}
        </h3>

        <div class="flex items-center">
            <!-- Add new questions -->
            <button type="button" @click="addQuestion()" class="flex items-center text-xs py-1 px-3 mr-2 rounded-sm text-white bg-gray-600 hover:bg-gray-700">
                <Plus class="h-4 w-4" />
                Add
            </button>
            <!--/. Add new questions -->

            <!-- Delete question -->
            <button type="button" @click="deleteQuestion()" class="flex items-center text-xs py-1 px-3 rounded-sm border border-transparent text-red-500 hover:text-red-500">
                <Trash class="h-4 w-4" />
                Delete
            </button>
            <!--/. Delete question -->
        </div>
    </div>
    <!--/. Question index -->

    <div class="grid gap-3 grid-cols-12">
        <!-- Question -->
        <div class="mt-3 col-span-9">
            <label :for="'question_text_' + model.data" class="block text-sm font-medium text-gary-700">
                Question Text
            </label>
            <input type="text" :name="'question_text_' + model.data" :id="'question_text_' + model.data"
                v-model="model.question" @change="dataChange()"
                class="mt-1 p-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border border-gray-300 rounded-md">
        </div>
        <!--/. Question -->

        <!-- Question type -->
        <div class="mt-3 col-span-3">
            <label for="question_type" class="block text-sm font-medium text-gary-700">
                Select question type
            </label>
            <select name="question_type" id="question_type" v-model="model.type" @change="typeChange"
                class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                <option v-for="(type, index) in questionTypes" :key="type" :value="type">{{ upperCaseFirst(type) }}
                </option>
            </select>
        </div>
        <!--/. Question type -->
    </div>

    <!-- Question description -->
    <div class="mt-3 col-span-9">
        <label :for="'question_text_' + model.id" class="block text-sm font-medium text-gary-700">
            Description
        </label>
        <textarea :name="'question_text_' + model.id" v-model="model.description" @change="dataChange()"
            :id="'question_text_' + model.id"
            class="mt-1 p-2 focus:ring-indigo-500 block w-full shadow-sm sm:text-sm border border-gray-300 rounded-md"></textarea>
    </div>
    <!--/. Question description -->

    <!-- Data -->
    <div>
        <div v-if="shouldHaveOptions()" class="mt-2">
            <h4 class="text-sm font-semibold mb-1 flex justify-between items-center">
                Options

                <!-- Add new questions -->
                <button type="button" @click="addOption" class="flex items-center text-xs py-1 px-2 rounded-sm text-white bg-gray-600 hover:bg-gray-700">
                    <Plus class="h-4 w-4" />
                    Add question
                </button>
                <!--/. Add new questions -->
            </h4>

            <div v-if="!model.data.options.length" class="text-xs text-gary-600 text-center py-3">
                You don't have any options defined
            </div>

            <!-- Options list -->
            <div v-for="(option, index) in model.data.options" :key="option.uuid" class="flex items-center mb-1">
                <span class="w-6 text-sm">{{ index + 1 }}</span>
                <input type="text" v-model="option.text" @change="dataChange()" class="w-full rounded-sm py-1 px-2 text-xs border border-gray-300 focus:border-indigo-500 rounded-md">

                <!-- Delete option -->
                <button type="button" @click="removeOption(option)" class="h-6 w-6 rounded-full flex items-center justify-center border border-transparent transition-colors hover:border-red-100">
                    <Trash class="h-4 w-4" />
                </button>
                <!--/. Delete option -->
            </div>
            <!--/. Options list -->
        </div>
    </div>
    <!--/. Data -->
    <hr class="my-4">
</template>
