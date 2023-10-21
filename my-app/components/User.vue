<template>
  <div>
    <div class="bg-gradient-to-r from-blue-300 to-purple-500 h-screen flex justify-center items-center">
      <div class="py-8 px-6 w-3/4 bg-white bg-opacity-30 rounded-lg shadow-lg backdrop-blur-xl backdrop-filter">
        <p class="text-lg text-center text-gray-700 mb-8">Hi  <strong> {{ currentUserData.name }} </strong> Here you can update & customize your personal Information </p>

      <div class="py-8 px-6  bg-white bg-opacity-30 rounded-lg shadow-lg backdrop-blur-xl backdrop-filter">
    <form @submit.prevent="updateUser" class="flex flex-col w-3/4">
      <div class="mb-5">
        <label class="text-gray-700 font-semibold mb-2" for="name">Insert your new name bellow : </label>
        <input type="text" v-model="user.name" value="'user.name'" class="bg-transparent border rounded-lg shadow border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 py-2 px-4 block w-full appearance-none leading-normal" id="name" name="name" placeholder="Type Your New Name " required>
      </div>
      <div class="mb-5">
        <label class="text-gray-700 font-semibold mb-2" for="email"> Reinter new e-mail address insted of this <strong> {{ currentUserData.email }} </strong> ,if you would to change : </label>
           <input type="email" v-model="user.email" class="bg-transparent border rounded-lg shadow border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 py-2 px-4 block w-full appearance-none leading-normal" id="email" name="email" placeholder="Type Your New Email Address"  required >
      </div>

      <div class="mb-5">
        <label class="text-gray-700 font-semibold mb-2" for="password">Password</label>
        <input type="password" v-model="user.password" class="bg-transparent border rounded-lg shadow border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 py-2 px-4 block w-full appearance-none leading-normal" id="password" name="password" placeholder="Inter your Password Here" required>
      </div>
      <button type="submit" class="bg-gradient-to-r from-purple-400 to-indigo-500 text-white font-semibold py-2 rounded-lg shadow-md hover:shadow-lg transition duration-300 ease-in-out mb-5">Save</button>
    </form>
  </div>
    </div>

  </div>
</div>

</template>


<script>
import axios from 'axios'

export default {
  props: {
    userId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      user: {
        id: null,
        name: '',
        email: '',
        password: ''
      },
      currentUserData: {}
    }
  },

  async fetch() {
    const response = await this.$axios.get(`http://127.0.0.1:8000/api/user/me/`);
    this.currentUserData = response.data.user;
  },

  methods: {
    updateUser() {
      const userId = this.$auth.user.id
      const updatedUser = Object.assign({}, this.user)
      delete updatedUser.id

      axios.put(`http://127.0.0.1:8000/api/users/${userId}`, updatedUser)
        .then(response => {
          console.log(response.data)
          this.user = response.data.user
        })
        .catch(error => {
          console.log(error.response.data.errors)
        })
    }
  },
}
</script>
