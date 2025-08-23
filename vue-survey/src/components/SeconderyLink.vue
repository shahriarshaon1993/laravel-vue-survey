<script setup>
defineProps({
    href: {
        type: Object,
        required: true,
    },
});
</script>

<template>
    <RouterLink
        :to="href"
        class="inline-flex items-center bg-indigo-50 text-indigo-600 cursor-pointer font-semibold text-center shadow-xs transition-all duration-500 text-sm hover:bg-indigo-100"
    >
        <slot />
    </RouterLink>
</template>
