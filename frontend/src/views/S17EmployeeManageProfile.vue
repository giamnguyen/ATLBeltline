<template>
  <v-layout align-center justify-center>
    <v-flex xs12 sm12 md8>
      <v-card class="elevation-12">
        <v-toolbar dark color="primary">
          <v-toolbar-title>Employee Manage Profile</v-toolbar-title>
        </v-toolbar>

        <v-card-text>
          <v-form>
            <v-layout row justify-space-between>
            <v-flex xs5>
              
                <v-layout justify-start row>
                <v-flex xs5>
                    <p class="text-md-center">First Name: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
                <v-layout justify-start row>
                <v-flex xs5>
                    <p class="text-md-center">Last Name: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-flex xs4>

                <v-layout justify-start row>
                <v-flex xs6>
                    <p class="text-md-center">Username: </p>
                </v-flex>
                <v-flex xs1>
                    <p>cwilson</p>
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs5>
                    <p class="text-md-center">Site Name: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-flex xs4>

                <v-layout justify-start row>
                <v-flex xs7>
                    <p class="text-md-center">Employee ID: </p>
                </v-flex>
                <v-flex xs1>
                    <p>123456789</p>
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs4>
                    <p class="text-md-center">Phone: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-flex xs4>

                <v-layout justify-start row>
                <v-flex xs7>
                    <p class="text-md-center">Address: </p>
                </v-flex>
                <v-flex xs8>
                    <p> 100 East Main Street, Seattle, WA 12345 </p>
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

        <template>
            <v-container fluid>
            <v-checkbox v-model="checkbox1" :label="`Visitor Account`"></v-checkbox>
            </v-container>
            </template>

            <v-layout row justify-space-between>
            <v-flex xs4>

                <v-layout justify-start row>
                <v-flex xs7>
                    <p class="text-md-center">Email: </p>
                </v-flex>
                <v-flex xs8>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>


            <v-layout align-center justify-center>
              <v-btn color="primary" to="/RegNav">Remove Email</v-btn>
              <v-btn color="primary" @click="onLogin">Add Email</v-btn>
            </v-layout>
            <v-layout align-center justify-center>
              <v-btn color="primary" to="/RegNav">Back</v-btn>
              <v-btn color="primary" to="/RegNav">Update</v-btn>
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
  data () {
    return  {
    emailStr: "",
    passwordStr: "" ,   
        e1: null,
        e2: null,
        e3: null,
        e4: null,
        items: [
          { text: 'State 1' },
          { text: 'State 2' },
          { text: 'State 3' },
          { text: 'State 4' }
        ],
        states: [
        'AL','AK','AS','AZ','AR','CA','CO','CT','DE','DC','FM','FL','GA',
        'GU','HI','ID','IL','IN','IA','KS','KY','LA','ME','MH','MD','MA',
        'MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND',
        'MP','OH','OK','OR','PW','PA','PR','RI','SC','SD','TN','TX','UT',
        'VT','VI','VA','WA','WV','WI','WY'
        ]
      }
  },
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