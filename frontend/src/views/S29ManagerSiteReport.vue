<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md9>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager Site Report</v-toolbar-title>
          </v-toolbar>

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
                <v-card-text>
                <p>Event Count Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                </v-card-text>
            </v-flex>
            <v-flex xs5>
              <v-card-text>
                <p>Staff Count Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                </v-card-text>
            </v-flex>
            <v-flex xs5>
              <v-card-text>
                <p>Total Visit Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                </v-card-text>
            </v-flex>
            <v-flex xs5>
              <v-card-text>
                <p>Total Revenue Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                </v-card-text>
            </v-flex>
            <v-flex xs5>
                <v-btn color="primary">Filter</v-btn>
                <v-btn color="primary">Daily detail</v-btn>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-data-table :headers="headers" :items="desserts" class="elevation-1">
                <template v-slot:items="props">
                <td>{{ props.item.Date }}</td>
                <td class="text-xs-right">{{ props.item.EventCount }}</td>
                <td class="text-xs-right">{{ props.item.StaffCount }}</td>
                <td class="text-xs-right">{{ props.item.TotalVisits }}</td>
                <td class="text-xs-right">{{ props.item.TotalRevenue }}</td>
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
           text: 'Date',
            align: 'left',
            sortable: false,
            value: 'Name'
          },
          { text: 'EventCount', value: 'EventCount' },
          { text: 'StaffCount', value: 'StaffCount' },
          { text: 'TotalVisits', value: 'TotalVisits' },
          { text: 'TotalRevenue', value: 'TotalRevenue' },
        ],
        desserts: [
          {
            Date: '2019-02-01',
            EventCount: '4',
            StaffCount: '7',
            TotalVisits: '200',
            TotalRevenue: '3280'
          },
          {
            Date: '2019-02-02',
            EventCount: '2',
            StaffCount: '2',
            TotalVisits: '50',
            TotalRevenue: '0'
          },
          {
            Date: '2019-02-03',
            EventCount: '1',
            StaffCount: '3',
            TotalVisits: '40',
            TotalRevenue: '0'
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>