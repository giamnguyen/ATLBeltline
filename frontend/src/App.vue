<template>
  <v-app dark>
    <!-- <v-navigation-drawer app></v-navigation-drawer>
    <v-toolbar app></v-toolbar>-->

    <v-content>
      <v-container fluid fill-height>
        <router-view></router-view>
      </v-container>
    </v-content>

    <v-footer app>
      <v-layout align-center justify-center>
        ©2019 — <strong>Team 40</strong>
      </v-layout>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      //
    };
  },
  created: function() {
    this.$http.interceptors.response.use(undefined, function(err) {
      return new Promise(function(resolve, reject) {
        if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
          this.$store.dispatch(logout);
        }
        throw err;
      });
    });
  }
};
</script>
