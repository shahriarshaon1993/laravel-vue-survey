import { createRouter, createWebHistory } from "vue-router";
import store from "@/store";

// Layouts
import AuthenticatedLayout from "@/layouts/AuthenticatedLayout.vue";
import GuestLayout from "@/layouts/GuestLayout.vue";
import AuthenticationLayout from "@/layouts/AuthenticationLayout.vue";

// Pages
import Dashboard from "@/views/admin/Dashboard.vue";
import AdminSurveys from "@/views/admin/Surveys.vue";
import SurveyView from "@/views/admin/SurveyView.vue";
import SurveyReport from "@/views/admin/SurveyReport.vue";
import Home from "@/views/Home.vue";
import NotFound from "@/views/NotFound.vue";
import SurveysView from "@/views/Surveys.vue";
import SurveyPublicView from "@/views/SurveyPublicView.vue";
import Login from "@/views/auth/Login.vue";
import Register from "@/views/auth/Register.vue";

const routes = [
    // Protected (admin-only area)
    {
        path: "/dashboard",
        component: AuthenticatedLayout,
        meta: { requiresAuth: true },
        children: [
            {
                path: "",
                name: "Dashboard",
                component: Dashboard,
                meta: { roles: ["admin"] },
            },
            {
                path: "surveys",
                name: "Surveys",
                component: AdminSurveys,
                meta: { roles: ["admin"] },
            },
            {
                path: "surveys/create",
                name: "SurveyCreate",
                component: SurveyView,
                meta: { roles: ["admin"] },
            },
            {
                path: "surveys/:id",
                name: "SurveyView",
                component: SurveyView,
                meta: { roles: ["admin"] },
            },
            {
                path: "reports/surveys/:slug",
                name: "SurveyReport",
                component: SurveyReport,
                meta: { roles: ["admin"] },
            },
        ],
    },

    // Public (open to everyone: unauth, guest, admin)
    {
        path: "/",
        component: GuestLayout,
        children: [
            { path: "", name: "Home", component: Home },
            { path: "surveys", name: "SurveysView", component: SurveysView },
            {
                path: "view/survey/:slug",
                name: "SurveyPublicView",
                component: SurveyPublicView,
                meta: { requiresAuth: true, roles: ["admin", "guest"] },
            },
        ],
    },

    // Auth (only for unauthenticated users)
    {
        path: "/auth",
        redirect: "/login",
        component: AuthenticationLayout,
        meta: { isGuest: true },
        children: [
            { path: "login", name: "Login", component: Login },
            { path: "register", name: "Register", component: Register },
        ],
    },
    { path: "/:pathMatch(.*)*", name: "NotFound", component: NotFound },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

// Helper: get flags once
function getRoleFlags() {
    const token = store.state.user.token;
    const roles = store.state.user.data?.roles || [];
    const isAdmin = roles.includes("admin");
    const isGuestRole = !isAdmin && roles.includes("guest");

    return { token, isAdmin, isGuestRole };
}

router.beforeEach(async (to, from, next) => {
    if (store.state.user.token && !store.state.user.data.id) {
        await store.dispatch("getMe");
    }
    const { token, isAdmin, isGuestRole } = getRoleFlags();

    const requiresAuth = to.matched.some((r) => r.meta?.requiresAuth);
    const guestOnly = to.matched.some((r) => r.meta?.isGuest);

    // Auth check
    if (requiresAuth && !token) {
        return next({ name: "Login" });
    }

    // Logged-in user cannot visit auth pages (login/register)
    if (token && guestOnly) {
        return next({ name: isAdmin ? "Dashboard" : "Home" });
    }

    // Role check (if any matched record declares roles)
    const requiredRoles = to.matched
        .map((r) => r.meta?.roles)
        .filter(Boolean)
        .flat();

    if (requiresAuth && requiredRoles.length > 0) {
        if (isAdmin) return next();
        if (isGuestRole && !requiredRoles.includes("guest")) {
            return next({ name: "Home" });
        }
    }

    return next();
});

export default router;
