<script setup>
import ApplicationLogo from "@/components/icons/ApplicationLogo.vue";
import NavLink from "@/components/app/NavLink.vue";

defineProps(["navigation"]);
</script>

<template>
    <div class="min-w-[260px] bg-gray-50">
        <RouterLink :to="{ name: 'Dashboard' }" class="h-[80px] px-3 flex items-center gap-3">
            <ApplicationLogo class="block h-8 w-auto fill-current text-gray-800" />
            My Survey
        </RouterLink>

        <div class="px-3">
            <template v-for="item in navigation">
                <NavLink :href="item.to" :active="$route.name === item.name">
                    {{ item.name }}
                </NavLink>
            </template>
        </div>
    </div>
</template>
