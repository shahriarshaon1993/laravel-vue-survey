<script setup>
const props = defineProps({
    title: String,
});
</script>

<template>
    <div>
        <header class="py-4 px-4">
            <h1 class="text-xl font-bold tracking-tight text-gray-900">
                {{ title }}
            </h1>
            <slot name="header"></slot>
        </header>
        <main class="px-4">
            <slot />
        </main>
    </div>
</template>
