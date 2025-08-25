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
    isActions: {
        type: Boolean,
        default: true,
    },
});

const emit = defineEmits(["delete"]);
</script>

<template>
    <Card class="break-inside-avoid p-4 relative space-y-6">
        <div
            v-if="!isActions && survey.participated"
            class="absolute top-0 left-0 w-full h-full z-20"
        ></div>
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
            <div v-if="isActions" class="flex justify-end text-sm">
                <div
                    class="bg-purple-400 text-white text-xs py-1 px-2 rounded-md"
                >
                    {{ survey.status ? "Active" : "Draft" }}
                </div>
            </div>

            <div
                v-if="!isActions && survey.participated"
                class="bg-green-400 text-white text-xs py-1 px-2 rounded-md inline-block"
            >
                Already Participated
            </div>

            <h3 class="font-bold text-xl hover:underline">
                <a :href="`/view/survey/${survey.slug}`" target="_blank">
                    {{ survey.title }}
                </a>
            </h3>

            <div v-html="survey.short_description"></div>
        </div>

        <div v-if="isActions" class="flex justify-between">
            <div class="flex gap-2">
                <PrimaryLink
                    class="py-2 px-3 rounded-md"
                    :href="{
                        name: 'SurveyView',
                        params: { id: survey.id },
                    }"
                >
                    <IconEdit class="h-5 w-5" />
                </PrimaryLink>

                <SeconderyLink
                    class="py-2 px-3 rounded-md"
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
