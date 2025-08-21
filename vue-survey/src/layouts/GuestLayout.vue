<script setup>
import Navbar from "@/components/app/Navbar.vue";
</script>

<template>
    <div class="min-h-screen bg-gray-200 text-gray-900 antialiased">
        <Navbar />
        <router-view></router-view>
    </div>
</template>
