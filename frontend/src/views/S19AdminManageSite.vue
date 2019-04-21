<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md8>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager Site</v-toolbar-title>
          </v-toolbar>


            <v-container id="dropdown-example" grid-list-xl>
                <v-layout justify-start row>
                
                    <v-flex xs5 offset>
                        <p class="text-md-center">Site: </p>

                        <v-overflow-btn
                            :items="transport_type"
                            label="Please Select One"
                            target="#dropdown-example"
                        ></v-overflow-btn>
                    </v-flex>

                    <v-flex xs5 offset>
                        <p class="text-md-center">Manager: </p>

                        <v-overflow-btn
                            :items="contain_site"
                            label="Please Select One"
                            target="#dropdown-example"
                        ></v-overflow-btn>
                    </v-flex>

                    <v-flex xs5 offset>
                        <p class="text-md-center">Open Everyday: </p>

                        <v-overflow-btn
                            :items="transport_type"
                            label="Please Select One"
                            target="#dropdown-example"
                        ></v-overflow-btn>
                    </v-flex>
                </v-layout>
            </v-container>


            <v-layout justify-center row>
                <v-btn color="primary" to="/RegNav">Filter</v-btn>
                <v-btn color="primary" to="/RegNav">Create</v-btn>
                <v-btn color="primary" to="/RegNav">Edit</v-btn>
                <v-btn color="primary" to="/RegNav">Delete</v-btn>                
            </v-layout>

            <v-layout justify-center row>
                <v-data-table v-model="selected" :headers="headers" :items="sites" item-key="name" select-all class="elevation-1">
                    <template v-slot:items="props">
                        <td><v-checkbox v-model="props.selected" primary hide-details></v-checkbox> </td>
                        <td>{{ props.item.name }}</td>
                        <td class="text-xs-right">{{ props.item.manager }}</td>
                        <td class="text-xs-right">{{ props.item.openEveryday }}</td>
                    </template>
                </v-data-table>
            </v-layout>
    

            <v-layout justify-center row>
                <v-btn color="primary" to="/RegNav">BACK</v-btn>
            </v-layout>
        </v-card>
      </v-flex>
    </v-layout>
</template>

<script>
  export default {
    data () {
        
      return {
        contain_site: ['Inman Park', 'Checking1', 'Checking2'],
        transport_type: ['MARTA', 'Bus', 'Bike', 'All'],
        selected: [],
        headers: [
          {
            text: 'Name',
            align: 'left',
            sortable: true,
            value: 'name'
          },
          { text: 'Manager', value: 'manager' },
          { text: 'Open Everyday', value: 'openEveryday' },
          
        ],
        sites: [
          {
            name : 'Be Xau',
            manager: 'Manager One',
            openEveryday: 'Yes',
          },
          {
            name : 'Be Xinh',
            manager: 'Manager Two',
            openEveryday: 'No',
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>