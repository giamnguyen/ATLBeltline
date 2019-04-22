<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md9>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>View Schedule</v-toolbar-title>
          </v-toolbar>

        <v-layout row justify-space-between>
            <v-flex xs4>

                <v-layout justify-start row>
                <v-flex xs5>
                    <p class="text-md-center">Event Name: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs4>
                    <p class="text-md-center">Description Keyword </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

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
        <v-btn color="primary">Filter</v-btn>
        <v-btn color="primary">View Event</v-btn>
        <v-layout row justify-space-between>
            <v-data-table :headers="headers" :items="desserts" class="elevation-1">
                <template v-slot:items="props">
                <td>{{ props.item.EventName }}</td>
                <td class="text-xs-right">{{ props.item.SiteName }}</td>
                <td class="text-xs-right">{{ props.item.StartDate }}</td>
                <td class="text-xs-right">{{ props.item.EndDate }}</td>
                <td class="text-xs-right">{{ props.item.StaffCount }}</td>
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
          {
            text: 'Event Name',
            align: 'left',
            sortable: true,
            value: 'EventName'
          },
          { text: 'Site Name', value: 'SiteName' },
          { text: 'Start Date', value: 'StartDate' },
          { text: 'End Date', value: 'EndDate' },
          { text: 'Staff Count', value: 'StaffCount' },
        ],
        desserts: [
          {
            EventName: 'abc',
            SiteName: 'def',
            StartDate: '1-1-1',
            EndDate: '1-1-1',
            StaffCount: '200',
          },
          {
            EventName: 'abc',
            SiteName: 'def',
            StartDate: '1-1-1',
            EndDate: '1-1-1',
            StaffCount: '200',
          },
          {
            EventName: 'abc',
            SiteName: 'def',
            StartDate: '1-1-1',
            EndDate: '1-1-1',
            StaffCount: '200',
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>