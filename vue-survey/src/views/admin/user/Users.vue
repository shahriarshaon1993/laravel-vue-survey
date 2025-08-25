<script setup>
import Table from "@/components/table/Table.vue";
import TableRow from "@/components/table/TableRow.vue";
import TableBody from "@/components/table/TableBody.vue";
import TableHead from "@/components/table/TableHead.vue";
import TableCell from "@/components/table/TableCell.vue";
import TableHeader from "@/components/table/TableHeader.vue";
import PageComponent from "@/components/PageComponent.vue";
</script>

<template>
    <PageComponent>
        <template v-slot:header>
            <div class="flex justify-between items-center">
                <h1 class="text-xl font-bold text-gray-900">Users</h1>
            </div>
        </template>

        <div class="animate-fade-in-down">
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
                        <TableRow>
                            <TableCell class="text-center">01</TableCell>
                            <TableCell>John Deo</TableCell>
                            <TableCell>shaon@gmail.com</TableCell>
                            <TableCell>Admin</TableCell>
                            <TableCell class="text-center">Delete</TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
            </div>
        </div>
    </PageComponent>
</template>
