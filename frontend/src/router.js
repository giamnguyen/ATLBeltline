import Vue from "vue";
import Router from "vue-router";
import UserLogin from "./views/UserLogin.vue";
import store from "./store";

Vue.use(Router);

const router = new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "UserLogin",
      component: UserLogin
    },
    {
      path: "/RegNav",
      name: "RegisterNav",
      component: () => import("./views/RegNav.vue")
    },
    {
      path: "/UserFunc",
      name: "UserFunctionality",
      component: () => import("./views/UserFunc.vue")
    },
    {
      path: "/secure",
      name: "secure",
      component: () => import("./views/Secure.vue"),
      meta: {
        requiresAuth: true
      }
    },
      //
      {
        path: "/ManagerFunctionality",
        name: "ManagerFunctionality",
        component: () => import("./views/ManagerFunctionality.vue")
      },
      {
        path: "/RegUser",
        name: "RegUser",
        component: () => import("./views/RegUser.vue")
      },

    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "about" */ "./views/About.vue")
    }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (store.getters.isLoggedIn) {
      next();
      return;
    }
    next("/");
  } else {
    next();
  }
});

export default router;
