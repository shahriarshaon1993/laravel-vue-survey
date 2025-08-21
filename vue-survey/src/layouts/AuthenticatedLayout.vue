<script>
import Notification from '@/components/Notification.vue';
import { Disclosure, DisclosureButton, DisclosurePanel, Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue'
import { useStore } from "vuex";
import { computed } from "vue";
import { useRouter } from "vue-router";
import Navigation from "@/components/app/Navigation.vue";

const navigation = [
    { name: 'Dashboard', to: { name: 'Dashboard' } },
    { name: 'Surveys', to: { name: 'Surveys' } },
];

export default {
    components: {
        Navigation,
        Disclosure,
        DisclosureButton,
        DisclosurePanel,
        Menu,
        MenuButton,
        MenuItem,
        MenuItems,
        Notification
    },
    setup() {
        const store = useStore();
        const router = useRouter();

        function logout() {
            store.dispatch('logout')
                .then(() => {
                    router.push({
                        name: 'Login'
                    });
                });
        }

        return {
            user: computed(() => store.state.user.data),
            navigation,
            logout
        };
    },
}
</script>

<template>
    <div class="h-screen bg-gray-200 flex w-full">
        <Navigation :navigation="navigation"/>

        <main class="flex flex-col flex-1 overflow-hidden">
            <div class="bg-gray-50 px-6 py-4">
                <div class="flex items-center justify-between w-full">
                    <div>Search</div>

                    <Menu as="div" class="ml-3 relative">
                        <div>
                            <MenuButton class="max-w-xs rounded-full flex items-center text-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white">
                                <span class="sr-only">Open user menu</span>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                            </MenuButton>
                        </div>
                        <transition enter-active-class="transition ease-out duration-100"
                                    enter-from-class="transform opacity-0 scale-95"
                                    enter-to-class="transform opacity-100 scale-100"
                                    leave-active-class="transition ease-in duration-75"
                                    leave-from-class="transform opacity-100 scale-100"
                                    leave-to-class="transform opacity-0 scale-95">
                            <MenuItems class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none">
                                <MenuItem v-slot="{ active }">
                                    <a @click="logout"
                                       class="block px-4 py-2 text-sm text-gray-700 cursor-pointer">Sign out</a>
                                </MenuItem>
                            </MenuItems>
                        </transition>
                    </Menu>
                </div>
            </div>

            <div class="flex-1 flex flex-col m-4 overflow-y-auto">
                <router-view></router-view>

                <Notification/>
            </div>
        </main>
    </div>
</template>
