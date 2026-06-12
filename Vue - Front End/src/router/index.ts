import { createRouter, createWebHistory } from "vue-router";

import Login from "@/views/auth/Login.vue";
import Register from "@/views/auth/Register.vue";
import DefaultLayout from "@/layouts/DefaultLayout.vue";
import Error404 from "@/views/error/Error404.vue";
import { useAuthStore } from "@/store/auth";
import TransactionDashboard from "@/views/transaction/dashboard/Index.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/login",
      name: "login",
      component: Login,
    },
    {
      path: "/register",
      name: "register",
      component: Register,
    },
    {
      path: "/",
      component: DefaultLayout,
      meta: { requiresAuth: true },
      children: [
        {
          path: "",
          redirect: { name: "transactionDashboard" },
        },
        {
          path: "transaction/dashboard",
          name: "transactionDashboard",
          component: TransactionDashboard,
        },
      ],
    },
    {
      path: "/:pathMatch(.*)*",
      name: "not-found",
      component: Error404,
    },
  ],
});

router.beforeEach(async (to, from, next) => {
  const auth = useAuthStore();
  if (to.meta.requiresAuth) {
    if (!auth.isAuthenticated || !auth.token) {
      return next({ name: "login" });
    }
  }
  if ((to.name === "login" || to.name === "register") && auth.isAuthenticated) {
    return next({ name: "transactionDashboard" });
  }
  next();
});

export default router;
