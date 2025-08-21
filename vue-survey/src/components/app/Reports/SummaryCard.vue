<script setup>
import Card from "@/components/app/Card.vue";

defineProps({ title: String });
</script>

<template>
    <Card class="p-4">
        <div class="text-sm text-gray-500">{{ title }}</div>
        <slot />
    </Card>
</template>
