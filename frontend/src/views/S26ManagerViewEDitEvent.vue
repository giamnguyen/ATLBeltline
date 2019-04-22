<template>
    
    <v-layout  align-center justify-center>
      <v-flex xs12 sm8 md10>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title> Manager View Edit Event</v-toolbar-title>
          </v-toolbar>

          <v-layout row justify-space-between>
            <v-flex xs3>
              
                <v-layout justify-start row >
                <v-flex xs5>
                    <p class="text-md-center">Name: </p>
                </v-flex>
                <v-flex xs5>
                    <p>Bus Tour</p>
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs7>
                <v-layout justify-start row>
                <v-flex xs6>
                    <p class="text-md-center">Price($): </p>
                </v-flex>
                <v-flex xs1>
                    <p>25</p>
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
                <v-flex xs7>
                    <p>2019-02-01</p>
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs3>
                    <p class="text-md-center">End Date: </p>
                </v-flex>
                <v-flex xs7>
                    <p>2019-02-01</p>
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-flex xs4>
                <v-layout justify-start row>
                <v-flex xs8>
                    <p class="text-md-center">Minimum Staff Required: </p>
                </v-flex>
                <v-flex xs7>
                    <p>4</p>
                </v-flex>
                </v-layout>
            </v-flex>

            <v-flex xs6>
              
                <v-layout justify-start row>
                <v-flex xs3>
                    <p class="text-md-center">Capacity: </p>
                </v-flex>
                <v-flex xs7>
                    <p>100</p>
                </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>

         <v-flex xs6>
                <p class="text-md-center">Staff Assigned: </p>

                <v-overflow-btn
                    :items="Staff_Assgined"
                    label="Please Select One"
                    segmented
                    target="#dropdown-example"
                ></v-overflow-btn>
            </v-flex>

        <!-- <p>Connected Sites:</p>
        <v-list>
            <v-list-tile
                v-for="item in items"
                :key="item.title"
                click=""
            >

                <v-list-tile-content>
                <v-list-tile-title v-text="item.title"></v-list-tile-title>
                </v-list-tile-content>

            </v-list-tile>
        </v-list> -->



        <v-flex xs3>
              <v-layout justify-start row>
              <v-flex xs6>
                  <p class="text-md-center">Description: </p>
              </v-flex>
              <v-flex xs1>
                  <input v-model="message" placeholder="">
              </v-flex>
              </v-layout>
        </v-flex>



        <v-layout column align-space-around justify-Start>
            <v-flex xs5>
                <v-card-text>
                <p>Daily Visit Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                </v-card-text>
            </v-flex>
            <v-flex xs5>
              <v-card-text>
                <p>Daily Revenue Range:</p>
                    <input v-model="message" placeholder="From">
                    <input v-model="message" placeholder="To">
                </v-card-text>
            </v-flex>
            <v-flex xs5>
                <v-btn color="primary">Filter</v-btn>
                <v-btn color="primary">Update</v-btn>
            </v-flex>
        </v-layout>

        <v-layout row justify-space-between>
            <v-data-table :headers="headers" :items="desserts" class="elevation-1">
                <template v-slot:items="props">

                <td class="text-xs-center">{{ props.item.Date }}</td>
                <td class="text-xs-center">{{ props.item.DailyVisits }}</td>
                <td class="text-xs-center">{{ props.item.DailyRevenue }}</td>
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
        Staff_Assgined: ['staff1', 'manager1', 'manager2'],
        headers: [
          { text: 'Date', value: 'Date'},
          { text: 'Daily Visits', value: 'DailyVisits' },
          { text: 'Daily Revenue', value: 'DailyRevenue' },
        ],
        desserts: [
          {
            Date: '2019-02-01',
            DailyVisits: '80',
            DailyRevenue: '2000',
          },
        ]
      }
    },
    props: {
      source: String
    }
  }
</script>