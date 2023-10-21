<template>
  <div class="grid grid-cols-10 justify-center gap-4">
    <div class="col-span-1 bg-gray-300 p-6">Column 1</div>
    <div class="col-span-8 bg-gray-100 p-6">    <div class="flex flex-wrap justify-center items-center">
      <div>
  <h1>Select cards:</h1>
  <template>
<div class="card-row">
  <Cards
    v-for="card in cards"
    :key="card.id"
    :card="card"
    @selected="handleCardSelection"
  />
</div>
</template>

</div>
  </div></div>
    <div class="col-span-1 bg-gray-500 p-6">Column 3<div>
<svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
<path stroke-linecap="round" stroke-linejoin="round" d="M7.864 4.243A7.5 7.5 0 0119.5 10.5c0 2.92-.556 5.709-1.568 8.268M5.742 6.364A7.465 7.465 0 004.5 10.5a7.464 7.464 0 01-1.15 3.993m1.989 3.559A11.209 11.209 0 008.25 10.5a3.75 3.75 0 117.5 0c0 .527-.021 1.049-.064 1.565M12 10.5a14.94 14.94 0 01-3.6 9.75m6.633-4.596a18.666 18.666 0 01-2.485 5.33"></path>
</svg>
</div></div>
  </div>
</template>

<script>
import Box from '~/components/Cards.vue';
import axios from 'axios';

export default {
  middleware: 'auth',
components: {
  Box,
},
data() {
  return {
    cards: [{
      id:'',
      title:'',
      subtitle:'',
      image:'',
      hoverImage:'',
      selected: false,
    }],
    user_id:this.$auth.user.id,
    selectedCards: [],
  };

},

async created() {
  try {
    const response = await axios.get(`http://127.0.0.1:8000/api/myinterest/${this.user_id}`);// Replace with your API endpoint
    this.cards = response.data.cards
  } catch (error) {
    console.error(error);
  }
},
};
</script>
