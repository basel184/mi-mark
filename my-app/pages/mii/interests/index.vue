<template>
  <div class="grid grid-cols-10 justify-center gap-4">
    <div class="col-span-2 bg-gray-200 p-6 border border-md max-h-full">

       <div v-if="selectedCards.length">
<div class=" position fixed">
    <ul class="flex flex-col bg-gray-100 p-2 border-gray-300 rounded h-48 overflow-y-auto scrollbar-visible scrollbar-track-gray-300" style="height:400px ;">
          <span> <strong>That Your choice </strong> </span>
            <li v-for="card in selectedCards" :key="card.id"  class="border-gray-400 flex flex-row mb-2 h-12 w-50  rounded-3xl" >
             <div class="select-none cursor-pointer bg-gray-200 rounded-md flex flex-1 items-center p-4  transition duration-500 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
              <div class="flex flex-col rounded-md w-10 h-10 bg-gray-300 justify-center items-center">
              <img class="object-cover object-center h-32" :src='card.image' alt='New image'>
                </div>
                 <div class="flex-1 pl-1 ">

                  <span> <p class="font-medium font-sans text-sm"> {{ card.name }}</p>  </span>

               </div>
               <div class="ml-auto">
    <button class="text-gray-500 focus:outline-none hover:text-gray-700" >
      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
      </svg>
    </button>
  </div>
            </div>

        </li>
        </ul>

    <form  @submit.prevent="sendSelectedCards" class="ml-2.5 mt-1.5">
      <button type="submit" class="text-white bg-gradient-to-r from-green-400 via-green-500 to-green-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-green-300 dark:focus:ring-green-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">Send Selected Interests</button>

  </form>
</div>
  </div></div>
    <div class="col-span-8 bg-gray-100 p-6">
      <span> <strong>Choose your Favoirate Interest:  </strong> </span>
       <div class="flex flex-wrap justify-center items-center">

      <div class="border border-md pt-4 ">

  <Box :cards="cards" :selected-cards="selectedCards" />

</div>
  </div>
</div>

  </div>
</template>

<script>
import Box from '~/components/Box.vue';
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
  selectedCards: [
  ],

};
},
methods: {

async sendSelectedCards() {
  try {

  const selectedCards = [...this.selectedCards];


    const response = await this.$axios.post('http://127.0.0.1:8000/api/cards', { selectedCards });
    if (response) {

alert('تم بنجاح ');
this.$router.push(`/mii/interests/myFav`)


} else {
alert(response.message);
}
    console.log('Selected card names saved successfully:', response.data);
    // Perform any additional actions after successfully saving the card names
  } catch (error) {
    console.error('Error saving selected card names:', error);
    // Handle the error accordingly
  }
},
},

async created() {
try {
  const response = await axios.get('http://127.0.0.1:8000/api/marks'); // Replace with your API endpoint
  this.cards = response.data.cards
} catch (error) {
  console.error(error);
}
},
};
</script>

