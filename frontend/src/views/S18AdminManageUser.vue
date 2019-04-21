<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md7>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager User</v-toolbar-title>
          </v-toolbar>

            <v-layout justify-start row>
                <v-flex xs1  offset-xs1>
                    <p class="text-md-center">Username: </p>
                </v-flex>
                <v-flex xs1 offset-xs1>
                    <input v-model="message" placeholder="Enter username">
                </v-flex>
            </v-layout>


            <v-layout justify-start row>
                

                <v-flex xs5 offset-xs1>
                    <p class="text-md-center">Type: </p>

                    <v-overflow-btn
                        :items="transport_type"
                        label="Please Select One"
                        target="#dropdown-example"
                    ></v-overflow-btn>
                </v-flex>

                <v-flex xs5 offset-xs1>
                    <p class="text-md-center">Status: </p>

                    <v-overflow-btn
                        :items="contain_site"
                        label="Please Select One"
                        target="#dropdown-example"
                    ></v-overflow-btn>
                </v-flex>
            </v-layout>

            <v-layout justify-center row>
                <v-btn color="primary" to="/RegNav">Filter</v-btn>
                <v-btn color="primary" to="/RegNav">Approve</v-btn>
                <v-btn color="primary" to="/RegNav">Decline</v-btn>
            </v-layout>

            <v-layout row justify-space-between>
                <v-data-table v-model="selected" :headers="headers" :items="users" item-key="username" select-all class="elevation-1">
                    <template v-slot:items="props">
                    <td><v-checkbox v-model="props.selected" primary hide-details></v-checkbox> </td>
                    <td>{{ props.item.username }}</td>
                    <td class="text-xs-right">{{ props.item.emailCount }}</td>
                    <td class="text-xs-right">{{ props.item.userType }}</td>
                    <td class="text-xs-right">{{ props.item.status }}</td>
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
            text: 'Username',
            align: 'left',
            sortable: true,
            value: 'username'
          },
          { text: 'Email Count', value: 'emailCount' },
          { text: 'User Type', value: 'userType' },
          { text: 'Status', value: 'status' },
          
        ],
        users: [
          {
            username : 'username1',
            emailCount: '2',
            userType: 'Manager',
            status: 'Aprroved',
          },
          {
            username : 'username2',
            emailCount: '3',
            userType: 'Manager',
            status: 'Pending',
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>