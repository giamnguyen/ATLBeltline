<template>
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md4>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Staff Functionality</v-toolbar-title>
          </v-toolbar>

          <!-- <v-card-actions> -->
            <v-layout row align-space-around justify-center>
              <v-flex md4>
                <v-layout align-space-around justify-left column>
                  <v-btn color="primary">Manage Profile</v-btn>
                  <v-btn color="primary">View Schedule</v-btn>
                  <v-btn color="primary">Take Transit</v-btn>
                  <v-btn color="primary">View Transit History</v-btn>
                </v-layout>
              </v-flex>

              <v-flex md4>
                <v-layout align-space-around justify-right column>
                  <v-btn color="primary">Explore Event</v-btn>
                  <v-btn color="primary">Explore Site</v-btn>
                  <v-btn color="primary">View Visit History</v-btn>
                  <v-btn color="primary">Back</v-btn>
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