<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md9>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Manager Site Report</v-toolbar-title>
          </v-toolbar>


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