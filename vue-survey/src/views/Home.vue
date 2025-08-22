<script setup>
import { useStore } from "vuex";
import { computed } from "vue";

const store = useStore();

const user = computed(() => store.state.user);
</script>

<template>
    <div>
        This home page

        <pre>{{ user }}</pre>
    </div>
</template>
