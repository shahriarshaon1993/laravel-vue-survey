<script setup>
defineProps({
    modelValue: {
        type: String,
        default: '',
    },
    rows: {
        type: Number,
        default: 3,
    },
});

defineEmits(['update:modelValue']);
</script>

<template>
    <textarea
        :rows="rows"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        class="border border-gray-400 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm p-2"
    />
</template>
