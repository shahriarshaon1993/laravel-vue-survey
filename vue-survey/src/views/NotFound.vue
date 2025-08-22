<template>
    <div class="flex flex-col items-center justify-center h-screen text-center">
        <h1 class="text-6xl font-bold text-red-600">404</h1>
        <p class="text-xl mt-4">
            Oops! The page you are looking for does not exist.
        </p>
        <router-link
            to="/"
            class="mt-6 px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
        >
            Go Back Home
        </router-link>
    </div>
</template>
