import { createRouter, createWebHistory } from "vue-router";
import Dashboard from "@/views/Dashboard.vue";
import Surveys from "@/views/Surveys.vue";
import SurveyView from "@/views/SurveyView.vue";
import SurveyReport from "@/views/SurveyReport.vue";
import Login from "@/views/Login.vue";
import Register from "@/views/Register.vue";
import SurveyPublicView from "@/views/SurveyPublicView.vue";
import AuthenticatedLayout from "@/layouts/AuthenticatedLayout.vue";
import AuthenticationLayout from "@/layouts/AuthenticationLayout.vue";
import store from "@/store";
import GuestLayout from "@/layouts/GuestLayout.vue";

const routes = [
    {
        path: "/",
        redirect: "/dashboard",
        component: AuthenticatedLayout,
        meta: { requiresAuth: true },
        children: [
            { path: "/dashboard", name: "Dashboard", component: Dashboard },
            { path: "/surveys", name: "Surveys", component: Surveys },
            {
                path: "/surveys/create",
                name: "SurveyCreate",
                component: SurveyView,
            },
            { path: "/surveys/:id", name: "SurveyView", component: SurveyView },
            {
                path: "/reports/surveys/:slug",
                name: "SurveyReport",
                component: SurveyReport,
            },
        ],
    },
    {
        path: "/view",
        redirect: "/view/survey/:slug",
        component: GuestLayout,
        meta: { isGuest: true },
        children: [
            {
                path: "/view/survey/:slug",
                name: "SurveyPublicView",
                component: SurveyPublicView,
            },
        ],
    },
    {
        path: "/auth",
        redirect: "/login",
        component: AuthenticationLayout,
        meta: { isGuest: true },
        name: "Auth",
        children: [
            { path: "/login", name: "Login", component: Login },
            { path: "/register", name: "Register", component: Register },
        ],
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

router.beforeEach((to, from, next) => {
    if (to.meta.requiresAuth && !store.state.user.token) {
        next({ name: "Login" });
    } else if (store.state.user.token && to.meta.isGuest) {
        next({ name: "Dashboard" });
    } else {
        next();
    }
});

export default router;
