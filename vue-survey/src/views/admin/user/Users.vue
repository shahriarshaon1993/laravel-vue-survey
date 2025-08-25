<script setup>
import store from "@/store";
import Table from "@/components/table/Table.vue";
import TableRow from "@/components/table/TableRow.vue";
import TableBody from "@/components/table/TableBody.vue";
import TableHead from "@/components/table/TableHead.vue";
import TableCell from "@/components/table/TableCell.vue";
import DangerButton from "@/components/DangerButton.vue";
import TableHeader from "@/components/table/TableHeader.vue";
import PageComponent from "@/components/PageComponent.vue";
import IconTrash from "@/components/icons/Trash.vue";

import { computed } from "vue";

const users = computed(() => store.state.users);

store.dispatch("getUsers");

function getForPage(ev, link) {
    ev.preventDefault();
    if (!link.url || link.active) {
        return;
    }

    store.dispatch("getUsers", { url: link.url });
}

function deleteUser(id) {
    if (confirm(`Are you sure you want to delete this user?`)) {
        store.dispatch("deleteUser", id).then(() => {
            store.dispatch("getUsers");
        });
    }
}
</script>

<template>
    <PageComponent>
        <template v-slot:header>
            <div class="flex justify-between items-center">
                <h1 class="text-xl font-bold text-gray-900">Users</h1>
            </div>
        </template>

        <div v-if="users.loading" class="flex justify-center">Loading...</div>

        <div v-else class="animate-fade-in-down">
            <div class="px-4 py-5 bg-white shadow rounded-md space-y-6 sm:p-6">
                <Table>
                    <TableHeader>
                        <TableRow>
                            <TableHead>Id</TableHead>
                            <TableHead>Name</TableHead>
                            <TableHead>Email</TableHead>
                            <TableHead>Role</TableHead>
                            <TableHead>Actions</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        <TableRow
                            v-for="(user, index) in users.data"
                            :key="user.id"
                        >
                            <TableCell class="text-center">
                                {{ index + 1 }}
                            </TableCell>
                            <TableCell>{{ user.name }}</TableCell>
                            <TableCell>{{ user.email }}</TableCell>
                            <TableCell>{{ user.roles[0] ?? "--" }}</TableCell>
                            <TableCell class="text-center">
                                <DangerButton
                                    @click="deleteUser(user.id)"
                                    class="py-1 px-2 rounded-md"
                                >
                                    <IconTrash class="w-5 h-5" />
                                </DangerButton>
                            </TableCell>
                        </TableRow>
                    </TableBody>
                </Table>

                <div class="flex justify-center mt-5">
                    <nav
                        class="relative z-0 inline-flex justify-center rounded-md shadow-sm"
                        aria-label="Pagination"
                    >
                        <a
                            v-for="(link, i) of users.links"
                            :key="i"
                            :disabled="!link.url"
                            href="#"
                            @click="getForPage($event, link)"
                            aria-current="page"
                            class="relative inline-flex items-center px-4 py-2 border text-sm font-medium whitespace-nowrap"
                            :class="[
                                link.active
                                    ? 'z-10 bg-indigo-50 border-indigo-500 text-indigo-600'
                                    : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-50',
                                i === 0 ? 'rounded-l-md' : '',
                                i === users.links.length - 1
                                    ? 'rounded-r-md'
                                    : '',
                            ]"
                            v-html="link.label"
                        >
                        </a>
                    </nav>
                </div>
            </div>
        </div>
    </PageComponent>
</template>
