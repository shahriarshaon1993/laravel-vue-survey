<script setup>
import Card from "@/components/app/Card.vue";

defineProps({ completion: Object });
</script>

<template>
    <Card class="p-4">
        <h2 class="text-lg font-semibold mb-2">Completion</h2>
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div class="rounded-lg p-4 border">
                <div class="text-xs text-gray-500">Started</div>
                <div class="text-xl font-semibold">
                    {{ completion?.started ?? 0 }}
                </div>
            </div>
            <div class="rounded-lg p-4 border">
                <div class="text-xs text-gray-500">Completed</div>
                <div class="text-xl font-semibold">
                    {{ completion?.completed ?? 0 }}
                </div>
            </div>
            <div class="rounded-lg p-4 border">
                <div class="text-xs text-gray-500">Completion Rate</div>
                <div class="text-xl font-semibold">
                    {{ completion?.completion_rate ?? 0 }}%
                </div>
            </div>
        </div>
    </Card>
</template>
