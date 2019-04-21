<template>
    
    <v-layout  align-center justify-center>
        <v-flex xs12 sm8 md7>
            <v-card class="elevation-12">
                <v-toolbar dark color="primary">
                    <v-toolbar-title>Edit Transit</v-toolbar-title>
                </v-toolbar>

                    <v-layout fill-height>
                    <v-flex xs12 align-end flexbox>
                        <span>Transport Type</span>
                    </v-flex>
                    </v-layout>

                <v-text-field
                    id="Route"
                    name="Route"
                    label="Route"
                    type="Route"
                    ></v-text-field>

                <v-layout column align-space-around justify-Start>
                    <v-flex xs5>
                        <v-card-text>
                        <p>Price ($):</p>
                            <input v-model="message" placeholder="0.0">
                        </v-card-text>
                        <p>Connected Sites:</p>
                        <v-list>
                            <v-list-tile
                                v-for="item in items"
                                :key="item.title"
                                @click=""
                            >

                                <v-list-tile-content>
                                <v-list-tile-title v-text="item.title"></v-list-tile-title>
                                </v-list-tile-content>

                            </v-list-tile>
                        </v-list> 

                        <v-btn color="primary">Back</v-btn>
                        <v-btn color="primary">Update</v-btn>
                    </v-flex>
                    <v-flex xs5>
                        
                    </v-flex>
                </v-layout>   

            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    export default {
        data () {
            return {
                items: [
                   {title: "Test1"}, 
                   {title: "Test2"},
                   {title: "Test3"},  
                ]
            }
        }
    }
</script>