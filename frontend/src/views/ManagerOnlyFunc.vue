<template>
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md4>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager Functionality</v-toolbar-title>
          </v-toolbar>

          <!-- <v-card-actions> -->
            <v-layout row align-space-around justify-center>
              <v-flex md4>
                <v-layout align-space-around justify-left column>
                  <v-btn color="primary" to="/RegNav">Manage Profile</v-btn>
                  <v-btn color="primary" to="/RegNav">Manage Event</v-btn>
                  <v-btn color="primary" to="/RegNav">View Staff</v-btn>
                  <v-btn color="primary" to="/RegNav">Back</v-btn>
                </v-layout>
              </v-flex>

              <v-flex md4>
                <v-layout align-space-around justify-right column>
                  <v-btn color="primary" to="/RegNav">View Site Report</v-btn>
                  <v-btn color="primary" to="/RegNav">Take Transit</v-btn>
                  <v-btn color="primary" to="/RegNav">View Transit History</v-btn>
                  <v-btn color="primary" to="/RegNav">Back</v-btn>

                </v-layout>
              </v-flex>

            </v-layout>
          <!-- </v-card-actions> -->
        </v-card>
      </v-flex>
    </v-layout>
</template>

<script>
  export default {
    data: () => ({
    }),
    props: {
      source: String
    }
  }
</script>