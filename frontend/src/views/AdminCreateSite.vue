<template>
  <v-layout align-center justify-center>
    <v-flex xs12 sm8 md4>
      <v-card class="elevation-12">
        <v-toolbar dark color="primary">
          <v-toolbar-title>Edit Site</v-toolbar-title>
        </v-toolbar>

        
         
            <v-text-field
              id="Name"
              name="Name"
              label="Name"
              type="Name"
            ></v-text-field>
            <v-text-field
              id="Zipcode"
              name="Zipcode"
              label="Zipcode"
              type="Zipcode"
            ></v-text-field>
            <v-text-field
              id="Adress"
              name="Adress"
              label="Adress"
              type="Adress"
            ></v-text-field>

            <template>
                <v-container fluid>
                    <v-layout row wrap align-center>
                    <v-flex xs6>
                        <v-subheader>Manager</v-subheader>
                    </v-flex>
                    <v-flex xs6>
                        <v-select
                        v-model="e2"
                        :items="managers"
                        menu-props="auto"
                        hide-details
                        label="Select"
                        single-line
                        ></v-select>
                    </v-flex>
                    </v-layout>
                </v-container>
            </template>
        
            <v-container fluid>
                <v-checkbox v-model="checkbox1" :label="`Open Everyday`"></v-checkbox>
            </v-container>

            <v-layout align-center justify-center>
              <v-btn color="primary">Create</v-btn>
              <v-btn color="primary">Back</v-btn>
            </v-layout>
        </v-card>    
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  data () {
    return  {
    managers :[
        'sample1', 'sample2', 'sample3'
    ]
    }
  }
};
</script>