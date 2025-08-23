<script setup>
import { ref } from "vue";
const { question, index, modelValue } = defineProps({
    question: Object,
    index: Number,
    modelValue: [String, Array],
});
const emits = defineEmits(["update:modelValue"]);

let model;
if (question.type === "checkbox") {
    model = ref({});
}

function onCheckboxChange($event) {
    const selectedOptions = [];
    for (let text in model.value) {
        if (model.value[text]) {
            selectedOptions.push(text);
        }
    }
    emits("update:modelValue", selectedOptions);
}
</script>

<template>
    <fieldset class="mb-4">
        <div>
            <legend class="text-xl text-left font-medium text-gray-900">
                {{ index + 1 }}. {{ question.question }}
            </legend>
        </div>
        <div class="mt-3">
            <div v-if="question.type === 'select'">
                <select
                    :value="modelValue"
                    @change="emits('update:modelValue', $event.target.value)"
                    class="mt-1 block w-full p-4 border border-gray-300 bg-gray-10 rounded-md shadow-sm focus:outline-none focus:ring-indigo-600 focus:border-indigo-600 sm:text-sm"
                >
                    <option value="">Please Select</option>
                    <option
                        v-for="option of question.data.options"
                        :key="option.uuid"
                        :value="option.text"
                    >
                        {{ option.text }}
                    </option>
                </select>
            </div>
            <div v-else-if="question.type === 'radio'">
                <label
                    v-for="option of question.data.options"
                    :key="option.uuid"
                    class="flex items-center my-2 p-4 border border-gray-300 rounded-md cursor-pointer bg-gray-100 hover:bg-gray-200"
                    :for="option.uuid"
                >
                    <input
                        :id="option.uuid"
                        :name="'question' + question.id"
                        :value="option.text"
                        @change="
                            emits('update:modelValue', $event.target.value)
                        "
                        type="radio"
                        class="focus:ring-indigo-600 h-4 w-4 text-indigo-600 border-gray-300"
                    />
                    <span
                        class="ml-3 block text-sm font-medium text-gray-700 cursor-pointer"
                    >
                        {{ option.text }}
                    </span>
                </label>
            </div>
            <div v-else-if="question.type === 'checkbox'">
                <label
                    v-for="option of question.data.options"
                    :key="option.uuid"
                    :for="option.uuid"
                    class="flex items-center my-2 p-4 border border-gray-300 rounded-md cursor-pointer bg-gray-100 hover:bg-gray-200"
                >
                    <input
                        :id="option.uuid"
                        v-model="model[option.text]"
                        :name="'question' + question.id"
                        @change="onCheckboxChange"
                        type="checkbox"
                        class="focus:ring-indigo-600 h-4 w-4 text-indigo-600 border-indigo-600"
                    />

                    <span class="ml-3 block text-sm font-medium text-gray-700">
                        {{ option.text }}
                    </span>
                </label>
            </div>
            <div v-else-if="question.type === 'text'">
                <input
                    type="text"
                    :value="modelValue"
                    @input="emits('update:modelValue', $event.target.value)"
                    class="mt-1 p-4 bg-gray-100 focus:ring-indigo-600 block w-full shadow-sm sm:text-sm border-gray-600 rounded-md"
                />
            </div>
            <div v-else-if="question.type === 'textarea'">
                <textarea
                    :value="modelValue"
                    @input="emits('update:modelValue', $event.target.value)"
                    class="mt-1 p-2 bg-gray-100 focus:ring-indigo-600 block w-full shadow-sm sm:text-sm border-gray-600 rounded-md"
                    rows="5"
                ></textarea>
            </div>
        </div>
    </fieldset>
</template>
