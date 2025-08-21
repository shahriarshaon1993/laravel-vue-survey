<script setup>
import Card from "@/components/app/Card.vue";
import Trash from "@/components/icons/Trash.vue";
import IconEdit from "@/components/icons/Edit.vue";
import IconEye from "@/components/icons/Eye.vue";

const { survey } = defineProps({
    survey: Object,
});

const emit = defineEmits(["delete"]);
</script>

<template>
    <Card class="break-inside-avoid mb-6">
        <div
            class="absolute text-sm px-2 py-0.5 rounded-lg left-1 top-1 shadow-md"
            :class="survey.status ? 'bg-gray-50' : 'bg-indigo-400 text-white'"
        >
            {{ survey.status ? "Active" : "Draft" }}
        </div>
        <a :href="`/view/survey/${survey.slug}`" target="_blank">
            <img
                :src="survey.image_url"
                :alt="survey.title"
                class="w-full h-52 object-cover rounded-t-lg"
            />
        </a>
        <div class="p-4">
            <a :href="`/view/survey/${survey.slug}`" target="_blank">
                <h5
                    class="text-xl font-semibold tracking-tight text-gray-900 hover:underline"
                >
                    {{ survey.title }}
                </h5>
            </a>
            <div
                v-html="survey.short_description"
                class="flex items-center mt-2.5 mb-5"
            ></div>

            <div class="flex items-center justify-between">
                <div class="flex gap-2">
                    <router-link
                        :to="{ name: 'SurveyView', params: { id: survey.id } }"
                    >
                        <IconEdit class="w-6 h-6 text-gray-900" />
                    </router-link>

                    <router-link
                        :to="{
                            name: 'SurveyReport',
                            params: { slug: survey.slug },
                        }"
                    >
                        <IconEye class="w-6 h-6 text-gray-900" />
                    </router-link>
                </div>

                <button
                    v-if="survey.id"
                    type="button"
                    @click="emit('delete', survey)"
                >
                    <Trash class="h-6 w-6 text-red-500" />
                </button>
            </div>
        </div>
    </Card>
</template>
