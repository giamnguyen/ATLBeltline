<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md9>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager manage Event</v-toolbar-title>
          </v-toolbar>

          <v-layout row justify-space-between>
            <v-flex xs3>
              
                <v-layout justify-start row>
                <v-flex xs5>
                    <p class="text-md-center">Name: </p>
                </v-flex>
                <v-flex xs1>
                    <input v-model="message" placeholder="">
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs7>
                <v-layout justify-start row>
                <v-flex xs5>
                    <p class="text-md-center">Description Keyword: </p>
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
                <v-card-text>
                <p>Duration Range:</p>
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
                <v-btn color="primary">Create</v-btn>
                <v-btn color="primary">Edit</v-btn>
                <v-btn color="primary">Delete</v-btn>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-data-table :headers="headers" :items="desserts" class="elevation-1">
                <template v-slot:items="props">
                <td>{{ props.item.Name }}</td>
                <td class="text-xs-right">{{ props.item.StaffCounts }}</td>
                <td class="text-xs-right">{{ props.item.DurationDays }}</td>
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
        contain_site: ['Inman Park', 'Checking1', 'Checking2'],
        transport_type: ['MARTA', 'Bus', 'Bike', 'All'],
        headers: [
          {
           text: 'Name',
            align: 'left',
            sortable: false,
            value: 'Name'
          },
          { text: 'StaffCounts', value: 'StaffCounts' },
          { text: 'DurationDays', value: 'DurationDays' },
          { text: 'TotalVisits', value: 'TotalVisits' },
          { text: 'TotalRevenue', value: 'TotalRevenue' },
        ],
        desserts: [
          {
            Name: 'Bus Tour',
            StaffCounts: '4',
            DurationDays: '1',
            TotalVisits: '80',
            TotalRevenue: '2000'
          },
          {
            Name: 'Private Bus Tour',
            StaffCounts: '1',
            DurationDays: '1',
            TotalVisits: '32',
            TotalRevenue: '1280'
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>