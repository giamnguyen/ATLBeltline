<template>
  <v-layout align-center justify-center>
    <v-flex xs12 sm8 md4>
      <v-card class="elevation-12">
        <v-toolbar dark color="primary">
          <v-toolbar-title>Register Visitor</v-toolbar-title>
        </v-toolbar>

        <v-card-text>
          <v-form>
            <v-text-field
              id="Firstname"
              name="Firstname"
              label="First Name"
              type="Firstname"
              v-model="passwordStr"
              :error-messages="passwordErrors"
              required
              @input="$v.passwordStr.$touch()"
              @blur="$v.passwordStr.$touch()"
            ></v-text-field>
            <v-text-field
              id="Lastname"
              name="Lastname"
              label="Last Name"
              type="Lastname"
              v-model="passwordStr"
              :error-messages="passwordErrors"
              required
              @input="$v.passwordStr.$touch()"
              @blur="$v.passwordStr.$touch()"
            ></v-text-field>
            <v-text-field
              id="Username"
              name="Username"
              label="Username"
              type="Username"
              v-model="passwordStr"
              :error-messages="passwordErrors"
              required
              @input="$v.passwordStr.$touch()"
              @blur="$v.passwordStr.$touch()"
            ></v-text-field>
            <v-text-field
              id="password"
              prepend-icon="lock"
              name="password"
              label="Password"
              type="password"
              v-model="passwordStr"
              :error-messages="passwordErrors"
              required
              @input="$v.passwordStr.$touch()"
              @blur="$v.passwordStr.$touch()"
            ></v-text-field>
            <v-text-field
              id="ConfirmPassword"
              prepend-icon="lock"
              name="ConfirmPassword"
              label="Confirm Password"
              type="ConfirmPassword"
              v-model="passwordStr"
              :error-messages="passwordErrors"
              required
              @input="$v.passwordStr.$touch()"
              @blur="$v.passwordStr.$touch()"
            ></v-text-field>
            <v-text-field
              prepend-icon="person"
              name="email"
              label="Email"
              type="text"
              v-model="emailStr"
              :error-messages="emailErrors"
              required
              @input="$v.emailStr.$touch()"
              @blur="$v.emailStr.$touch()"
            ></v-text-field>
            <v-layout align-center justify-center>
              <v-btn color="primary" to="/RegNav">Remove Email</v-btn>
              <v-btn color="primary" @click="onLogin">Add Email</v-btn>
            </v-layout>
            <v-layout align-center justify-center>
              <v-btn color="primary" to="/RegNav">Back</v-btn>
              <v-btn color="primary" @click="onLogin">Login</v-btn>
              <v-btn color="primary" to="/RegNav">Register</v-btn>
            </v-layout>
          </v-form>
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import { required, email } from "vuelidate/lib/validators";
const axios = require("axios");

export default {
  validations: {
    emailStr: { required, email },
    passwordStr: { required }
  },
  data: () => ({
    emailStr: "",
    passwordStr: ""
  }),
  computed: {
    passwordErrors() {
      const errors = [];
      if (!this.$v.passwordStr.$dirty) return errors;
      !this.$v.passwordStr.required && errors.push("Password is required.");
      return errors;
    },
    emailErrors() {
      const errors = [];
      if (!this.$v.emailStr.$dirty) return errors;
      !this.$v.emailStr.email && errors.push("Must be valid e-mail");
      !this.$v.emailStr.required && errors.push("E-mail is required");
      return errors;
    }
  },
  methods: {
    onLogin() {
      this.$v.$touch();
      // if (this.$v.$invalid) return

      let Username = "test1";
      let Password = "test1";
      
      this.$store
        .dispatch("login", { Username, Password })
        .then(() => this.$http.post("http://localhost:3000/users/login"))
        .catch(err => console.log(err));

      // axios
      //   .post("http://localhost:3000/users/login", {
      //     Username: "test1",
      //     Password: "test1"
      //   })
      //   .then(function(response) {
      //     console.log(response);
      //   })
      //   .catch(function(error) {
      //     console.log(error);
      //   });
    }
  }
};
</script>