<script setup>
import Card from "@/components/app/Card.vue";
import Trash from "@/components/icons/Trash.vue";
import IconEdit from "@/components/icons/Edit.vue";
import IconEye from "@/components/icons/Eye.vue";
import DangerButton from "@/components/DangerButton.vue";
import PrimaryLink from "@/components/PrimaryLink.vue";
import SeconderyLink from "@/components/SeconderyLink.vue";

const { survey } = defineProps({
    survey: Object,
});

const emit = defineEmits(["delete"]);
</script>

<template>
    <Card class="break-inside-avoid p-4 mb-6 relative space-y-6">
        <a
            :href="`/view/survey/${survey.slug}`"
            target="_blank"
            class="w-full relative h-auto"
        >
            <img
                :src="survey.image_url"
                :alt="survey.title"
                class="w-full max-w-full h-auto rounded-xl"
            />
        </a>

        <div class="space-y-1">
            <div class="flex justify-end text-sm">
                <div
                    class="bg-purple-400 text-white text-xs py-1 px-2 rounded-md"
                >
                    {{ survey.status ? "Active" : "Draft" }}
                </div>
            </div>

            <h3 class="font-bold text-xl hover:underline">
                <a :href="`/view/survey/${survey.slug}`" target="_blank">
                    {{ survey.title }}
                </a>
            </h3>

            <div v-html="survey.short_description"></div>
        </div>

        <div class="flex justify-between">
            <div class="flex gap-2">
                <PrimaryLink
                    :href="{
                        name: 'SurveyView',
                        params: { id: survey.id },
                    }"
                >
                    <IconEdit class="h-5 w-5" />
                </PrimaryLink>

                <SeconderyLink
                    :href="{
                        name: 'SurveyReport',
                        params: { slug: survey.slug },
                    }"
                >
                    <IconEye class="h-5 w-5" />
                </SeconderyLink>
            </div>

            <DangerButton
                v-if="survey.id"
                type="button"
                @click="emit('delete', survey)"
            >
                <Trash class="h-5 w-5" />
            </DangerButton>
        </div>
    </Card>
</template>
