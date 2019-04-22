<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md9>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager Manage Staff</v-toolbar-title>
          </v-toolbar>


          <v-layout row justify-space-between>
            <v-flex xs1>
                <v-layout justify-start row>
                <v-flex x1>
                    <p class="text-md-center">Site: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

          <v-layout row justify-space-between>
            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs4>
                    <p class="text-md-center">First Name: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs7>
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
                <v-flex xs5>
                    <p class="text-md-center">Start Date: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs4>
                    <p class="text-md-center">End Date: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>


        <v-layout column align-space-around justify-Start>
            <v-flex xs5>
                <v-btn color="primary">Filter</v-btn>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-data-table :headers="headers" :items="desserts" class="elevation-1">
                <template v-slot:items="props">
                <td class="text-xs-right">{{ props.item.StaffNames }}</td>
                <td class="text-xs-right">{{ props.item.EventShifts }}</td>
                </template>
             </v-data-table>
        </v-layout>
        <v-btn color="primary">Back</v-btn>
        </v-card>
      </v-flex>
    </v-layout>
</template>

<script>
  export default {
    data () {
        
      return {
        headers: [
          { text: 'StaffNames', value: 'StaffNames', align: 'center' },
          { text: 'EventShifts', value: 'EventShifts', align: 'center' },
        ],
        desserts: [
          {
            StaffNames: 'Alice Smith',
            EventShifts: '2',
            align: 'center',
          },
          {
            StaffNames: 'David Smith',
            EventShifts: '1',
            align: 'center',
          },
          {
            StaffNames: 'James Smith',
            EventShifts: '1',
            align: 'center',
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>