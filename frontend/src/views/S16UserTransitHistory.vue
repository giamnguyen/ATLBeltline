<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md7>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Transit History</v-toolbar-title>
          </v-toolbar>

            <v-container id="dropdown-example" grid-list-xl>
              <v-layout justify-center row>
                  <v-flex xs5 offset-xs1>
                  <p class="text-md-center">Transport Type: </p>

                  <v-overflow-btn
                      :items="transport_type"
                      label="Please Select One"
                      target="#dropdown-example"
                  ></v-overflow-btn>
                  </v-flex>

                  <v-flex xs5 offset-xs1>
                      <p class="text-md-center">Contain Site: </p>

                      <v-overflow-btn
                          :items="contain_site"
                          label="Please Select One"
                          target="#dropdown-example"
                      ></v-overflow-btn>
                  </v-flex>
              </v-layout>
            </v-container>

            <v-layout row justify-space-between>
                <v-flex xs5 offset-xs1>
                    <p class="text-md-start">Route: </p>
                    <input v-model="message" placeholder="Enter Route">
                </v-flex>
                <v-flex xs5 offset-xs1>
                    <p class="text-md-start">Start Date: </p>
                    <input v-model="message" placeholder="Enter Start Date">
                </v-flex>
                <v-flex xs5 offset-xs1>
                    <p class="text-md-start">End Date: </p>
                    <input v-model="message" placeholder="Enter End Date">
                </v-flex>
            </v-layout>

            <v-layout justify-center row>
                <v-btn color="primary" to="/RegNav">Filter</v-btn>
            </v-layout>

            <v-layout row justify-space-between>
                <v-data-table :headers="headers" :items="transits" class="elevation-1">
                    <template v-slot:items="props">
                    <td>{{ props.item.date }}</td>
                    <td class="text-xs-right">{{ props.item.route }}</td>
                    <td class="text-xs-right">{{ props.item.transportType }}</td>
                    <td class="text-xs-right">{{ props.item.price }}</td>
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
        headers: [
          {
            text: 'Date',
            align: 'left',
            sortable: true,
            value: 'date'
          },
          { text: 'Route', value: 'route' },
          { text: 'Transport Type', value: 'transportType' },
          { text: 'Price', value: 'price' },
          
        ],
        transits: [
          {
            date : '2019-02-01',
            route: '816',
            transportType: 'Bus',
            price: '2.5',
          },
          {
            date : '2019-02-05',
            route: 'Blue',
            transportType: 'MARTA',
            price: '3.0',
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>