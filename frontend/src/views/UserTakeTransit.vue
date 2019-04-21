<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md7>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Take Transit</v-toolbar-title>
          </v-toolbar>

        <v-layout row justify-space-between>
            <v-flex xs5 offset-xs1>
                <p class="text-md-center">Contain Site: </p>

                <v-overflow-btn
                    :items="contain_site"
                    label="Please Select One"
                    segmented
                    target="#dropdown-example"
                ></v-overflow-btn>
            </v-flex>

            <v-flex xs5 offset-xs1>
            <p class="text-md-center">Transport Type: </p>

            <v-overflow-btn
                :items="transport_type"
                label="Please Select One"
                segmented
                target="#dropdown-example"
            ></v-overflow-btn>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-data-table :headers="headers" :items="desserts" class="elevation-1">
                <template v-slot:items="props">
                <td>{{ props.item.route }}</td>
                <td class="text-xs-right">{{ props.item.transportType }}</td>
                <td class="text-xs-right">{{ props.item.price }}</td>
                <td class="text-xs-right">{{ props.item.connectedSites }}</td>
                </template>
             </v-data-table>
        </v-layout>
    

        <v-layout column align-space-around justify-Start>
            <v-flex xs5>
                <v-card-text>
                <p class="text-lg-right">Price Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                    <!-- <p class="text-md-center">Center align on medium viewport sizes</p>
                    <p class="text-sm-left">Left align on small viewport sizes</p>
                    <p class="text-xs-center">Center align on all viewport sizes</p>
                    <p class="text-xs-right">Right align on all viewport sizes</p> -->
                </v-card-text>
                <v-btn color="primary" to="/RegNav">Filter</v-btn>
            </v-flex>
            <v-flex xs5>
                
            </v-flex>
        </v-layout>

          <!-- <v-card-actions> -->
            <v-layout column align-start justify-space-between>
              <v-flex xs5>
                  <v-card-text>
                  <p class="text-lg-center">Transit Date:</p>
                  <input v-model="message" placeholder="Enter Date">
                  </v-card-text>
                  <v-btn color="primary" to="/RegNav">Log Transit</v-btn>
                <v-btn color="primary" to="/RegNav">Back</v-btn>

              </v-flex>

            </v-layout>
          <!-- </v-card-actions> -->
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
           text: 'Route',
            align: 'left',
            sortable: false,
            value: 'route'
          },
          { text: 'Transport Type', value: 'transportType' },
          { text: 'Price', value: 'price' },
          { text: '#Connected Sites', value: 'connectedSites' },
        ],
        desserts: [
          {
            route: '816',
            transportType: 'Bus',
            price: '2.5',
            connectedSites: '5'
          },
          {
            route: 'Blue',
            transportType: 'MARTA',
            price: '3.0',
            connectedSites: '4'
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>