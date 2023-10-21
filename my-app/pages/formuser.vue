<template>
  <div 	v-if="$auth.loggedIn">
    <h1>Contact Information</h1>

  
    <div class="bg-gradient-to-tr from-fuchsia-300 to-sky-500">
  <section id="login" class="p-4 flex flex-col justify-center min-h-screen max-w-md mx-auto">
    <div class="p-6 bg-sky-100 rounded">
      <div class="flex items-center justify-center font-black m-3 mb-12">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 mr-3 text-red-600 animate-pulse" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
        </svg>
      <h1 class="tracking-wide text-3xl text-gray-900">Buy Me a Laptop</h1>
      </div>
        <form @submit.prevent="handleSubmit"
        class="flex flex-col justify-center">
        <div class="flex justify-between items-center mb-3">
          <div class="inline-flex items-center self-start">
       
          
          </div>
          <div class="flex">
         
            
           
           
          </div>
        </div>
           <label for="bio" class="text-sm font-medium">bio</label>
           <input type="text" id="bio" v-model="bio" class="mb-3 px-2 py-1.5 mb-3 mt-1 block w-full px-2 py-1.5 border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400 focus:outline-none  focus:border-sky-500 focus:ring-1 focus:ring-sky-500 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
         
           <label for="mobile">mobile</label>
           <input type="text" id="mobile" v-model="mobile" class="mb-3 px-2 py-1.5 mb-3 mt-1 block w-full px-2 py-1.5 border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400 focus:outline-none  focus:border-sky-500 focus:ring-1 focus:ring-sky-500 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
         
           <label for="date_of_birth">Date of birth</label>
           <input type="date" id="date_of_birth" v-model="date_of_birth" class="mb-3 px-2 py-1.5 mb-3 mt-1 block w-full px-2 py-1.5 border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400 focus:outline-none  focus:border-sky-500 focus:ring-1 focus:ring-sky-500 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
           
           <div class="flex items-center mb-4">
    <input id="male" type="radio" name="gender" value="Male" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600" checked>
    <label for="male" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
      Male
    </label>
  </div>

  <div class="flex items-center mb-4">
    <input id="female" type="radio" name="gender" value="Female" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600">
    <label for="female" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
      Female
    </label>
  </div>
       <label for="city">Your City</label>
           <input type="text" id="city" v-model="city" class="mb-3 px-2 py-1.5 mb-3 mt-1 block w-full px-2 py-1.5 border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400 focus:outline-none  focus:border-sky-500 focus:ring-1 focus:ring-sky-500 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
         
           <label for="countery">Your Countery</label>
           <input type="text" id="countery" v-model="countery" class="mb-3 px-2 py-1.5 mb-3 mt-1 block w-full px-2 py-1.5 border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400 focus:outline-none  focus:border-sky-500 focus:ring-1 focus:ring-sky-500 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
         
          <button class="px-4 py-1.5 rounded-md shadow-lg bg-gradient-to-r from-pink-600 to-red-600 font-medium text-gray-100 block transition duration-300" type="submit">
          
            <span id="login_default_state">Save<span id="subtotal"></span></span>
          </button>
        </form>
    </div>
    </section>
    </div>
</div>
</template>

<script>
export default {
 data() {
   return {
    user_id: this.$auth.user.id,
    bio: '',
    mobile: '',
    date_of_birth:'', 
    countery:'',
    gender:'',
    avatar:'xxxx',
    cover:'cccc',
    city:'',

     success: false
   }
 },
 methods: {
   handleImageChange(event) {
     this.image = event.target.files[0]
   },
   async handleSubmit() {
     const formData = new FormData()
     formData.append('bio', this.bio)
     formData.append('mobile', this.mobile)
     formData.append('date_of_birth', this.date_of_birth)
     formData.append('countery', this.countery)
     formData.append('city', this.city)
     formData.append('gender', this.gender)
     formData.append('avatar', this.avatar)
     formData.append('cover', this.cover)
     formData.append('user_id', this.$auth.user.id)
    const  response = await this.$axios.post('http://127.0.0.1:8000/api/info', formData)
     // Handle the response
     this.post = response.data.post
     this.image_url = response.data.image_url
     this.success = response.data.success
   }
 }
}
</script>
