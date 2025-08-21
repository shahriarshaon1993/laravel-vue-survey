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
            <legend class="text-xl font-medium text-gray-900">
                {{ index + 1 }}. {{ question.question }}
            </legend>
        </div>
        <div class="mt-3">
            <div v-if="question.type === 'select'">
                <select
                    :value="modelValue"
                    @change="emits('update:modelValue', $event.target.value)"
                    class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-[#F7BE38] focus:border-[#F7BE38] sm:text-sm"
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
                    class="flex items-center my-2 py-2 px-4 border border-gray-300 rounded-md cursor-pointer hover:bg-gray-100"
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
                        class="focus:ring-[#F7BE38] h-4 w-4 text-[#F7BE38] border-gray-300"
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
                    class="flex items-center my-2 py-2 px-4 border border-gray-300 rounded-md cursor-pointer hover:bg-gray-100"
                >
                    <input
                        :id="option.uuid"
                        v-model="model[option.text]"
                        :name="'question' + question.id"
                        @change="onCheckboxChange"
                        type="checkbox"
                        class="focus:ring-[#F7BE38] h-4 w-4 text-[#F7BE38] border-gray-300"
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
                    class="mt-1 p-2 focus:ring-[#F7BE38] focus:border-[#F7BE38] block w-full sm:text-sm border-gray-600 rounded-md"
                />
            </div>
            <div v-else-if="question.type === 'textarea'">
                <textarea
                    :value="modelValue"
                    @input="emits('update:modelValue', $event.target.value)"
                    class="mt-1 p-2 focus:ring-[#F7BE38] block w-full shadow-sm sm:text-sm border-gray-600 rounded-md"
                ></textarea>
            </div>
        </div>
    </fieldset>
</template>
