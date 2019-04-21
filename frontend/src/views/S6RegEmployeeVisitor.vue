<template>
  <v-layout align-center justify-center>
    <v-flex xs12 sm8 md4>
      <v-card class="elevation-12">
        <v-toolbar dark color="primary">
          <v-toolbar-title>Register Employee-Visitor</v-toolbar-title>
        </v-toolbar>

        <v-card-text>
          <v-form>
            <v-text-field
              id="Firstname"
              name="Firstname"
              label="First Name"
              type="Text"
              v-model="Firstname"
              required
              @input="$v.Firstname.$touch()"
              @blur="$v.Firstname.$touch()"
            ></v-text-field>
            <v-text-field
              id="Lastname"
              name="Lastname"
              label="Last Name"
              type="Text"
              v-model="Lastname"
              required
              @input="$v.Lastname.$touch()"
              @blur="$v.Lastname.$touch()"
            ></v-text-field>
            <v-text-field
              id="Username"
              name="Username"
              label="Username"
              type="Text"
              v-model="Username"
              required
              @input="$v.Username.$touch()"
              @blur="$v.Username.$touch()"
            ></v-text-field>
            <v-text-field
              id="password"
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
              name="ConfirmPassword"
              label="Confirm Password"
              type="password"
              v-model="ConfirmPassword"
              :error-messages="passwordErrors"
              required
              @input="$v.ConfirmPassword.$touch()"
              @blur="$v.ConfirmPassword.$touch()"
            ></v-text-field>
            <v-text-field
              id="Phone"
              name="Phone"
              label="Phone"
              type="Text"
              v-model="Phone"
              required
              @input="$v.Phone.$touch()"
              @blur="$v.Phone.$touch()"
            ></v-text-field>
            <v-text-field
              id="Address"
              name="Address"
              label="Address"
              type="Text"
              v-model="Address"
              required
              @input="$v.Address.$touch()"
              @blur="$v.Address.$touch()"
            ></v-text-field>
            <v-text-field
              id="City"
              name="City"
              label="City"
              type="Text"
              v-model="City"
              required
              @input="$v.City.$touch()"
              @blur="$v.City.$touch()"
            ></v-text-field>
            <v-text-field
              id="Zipcode"
              name="Zipcode"
              label="Zipcode"
              type="Text"
              v-model="Zipcode"
              required
              @input="$v.Zipcode.$touch()"
              @blur="$v.Zipcode.$touch()"
            ></v-text-field>

            <template>
              <v-container fluid>
                <v-layout row wrap align-center>
                  <v-flex xs6>
                    <v-subheader>State</v-subheader>
                  </v-flex>
                  <v-flex xs6>
                    <v-select
                      v-model="e2"
                      :items="states"
                      menu-props="auto"
                      hide-details
                      label="Select"
                      single-line
                    ></v-select>
                  </v-flex>
                </v-layout>
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
        .then(() => this.$http.post("http://localhost:3000/users/login"));
        // .catch(err => console.log(err));

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