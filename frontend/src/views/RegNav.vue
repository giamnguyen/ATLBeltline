<template>
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md4>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Register Navigation</v-toolbar-title>
          </v-toolbar>

          <!-- <v-card-actions> -->
            <v-layout row>
              <v-flex></v-flex>

              <v-flex md5>
                <v-layout align-space-around justify-center column>
                  <v-btn color="primary">User Only</v-btn>
                  <v-btn color="primary">Visitor Only</v-btn>
                  <v-btn color="primary">Employee Only</v-btn>
                  <v-btn color="primary">Employee-Visitor</v-btn>
                  <v-btn color="primary">Back</v-btn>
                </v-layout>
              </v-flex>

              <v-flex></v-flex>
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