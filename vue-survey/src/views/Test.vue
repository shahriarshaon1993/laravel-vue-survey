<template>
    <PageComponent title="This page only for testing thinks">
        <p>{{ info }}</p>
    </PageComponent>
</template>

<script setup>
    import PageComponent from '@/components/PageComponent.vue';
    import { onMounted, ref } from 'vue';
    import axios from 'axios';
    
    const info = ref({});

    onMounted(() => {
        axios
            .get('https://api.coindesk.com/v1/bpi/currentprice.json')
            .then((res) => {
                info.value = res.data.bpi;
            })
    });
</script>

<style>

</style>