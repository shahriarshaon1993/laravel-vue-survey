import { computed } from "vue";
import store from "@/store";

export function useAuthentication() {
    const isAuth = computed(() => !!store.state.user.token);

    const roles = computed(() => store.state.user.data?.roles || []);

    const isAdmin = computed(() => roles.value.includes("admin"));

    const hasRoles = (requiredRoles) => {
        if (isAdmin.value) return true;

        return roles.value.some((role) => requiredRoles.includes(role));
    };

    return { isAuth, roles, isAdmin, hasRoles };
}
