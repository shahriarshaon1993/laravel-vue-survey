<script setup>
import Navbar from "@/components/app/Navbar.vue";
import IconBar from "@/components/icons/Bar.vue";
import PrimaryLink from "@/components/PrimaryLink.vue";
import SeconderyLink from "@/components/SeconderyLink.vue";
import IconChevronRight from "@/components/icons/ChevronRight.vue";
import ApplicationLogo from "@/components/icons/ApplicationLogo.vue";
</script>

<template>
    <div>
        <Navbar />
        <section
            class="bg-[url('@/assets/images/hero-bg.png')] bg-center bg-cover"
        >
            <router-view></router-view>
        </section>
    </div>
</template>
