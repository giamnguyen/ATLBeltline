<template>
  <v-layout align-center justify-center>
    <v-flex xs12 sm8 md4>
      <v-card class="elevation-12">
        <v-toolbar dark color="primary">
          <v-toolbar-title>Employee Manage Profile</v-toolbar-title>
        </v-toolbar>

        <v-card-text>
          <v-form>
            <v-text-field
              id="Firstname"
              name="Firstname"
              label="First Name"
              type="Firstname"
              v-model="Firstname"
              required
              @input="$v.Firstname.$touch()"
              @blur="$v.Firstname.$touch()"
            ></v-text-field>
            <v-text-field
              id="Lastname"
              name="Lastname"
              label="Last Name"
              type="Lastname"
              v-model="passwordStr"
              required
              @input="$v.Lastname.$touch()"
              @blur="$v.Lastname.$touch()"
            ></v-text-field>
            <v-text-field
              id="Username"
              name="Username"
              label="Username"
              type="Username"
              v-model="Username"
              required
              @input="$v.Username.$touch()"
              @blur="$v.Username.$touch()"
            ></v-text-field>
            <v-text-field
              id="sitename"
              name="sitename"
              label="Site name"
              type="sitename"
              v-model="sitename"
              required
              @input="$v.sitename.$touch()"
              @blur="$v.sitename.$touch()"
            ></v-text-field>
            <v-text-field
              id="EmployeeID"
              name="EmployeeID"
              label="Employee ID"
              type="EmployeeID"
              v-model="EmployeeID"
              @input="$v.EmployeeID.$touch()"
              @blur="$v.EmployeeID.$touch()"
            ></v-text-field>
            <v-text-field
              id="Phone"
              name="Phone"
              label="Phone"
              type="Phone"
              v-model="Phone"
              required
              @input="$v.Phone.$touch()"
              @blur="$v.Phone.$touch()"
            ></v-text-field>
            <v-text-field
              id="FullAddress"
              name="FullAddress"
              label="Full Address"
              type="FullAddress"
              v-model="FullAddress"
              required
              @input="$v.FullAddress.$touch()"
              @blur="$v.FullAddress.$touch()"
            ></v-text-field>

            <template>
            <v-container fluid>
            <v-checkbox v-model="checkbox1" :label="`Visitor Account`"></v-checkbox>
            </v-container>
            </template>

            <v-text-field
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