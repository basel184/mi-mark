// pages/register/index.vue
<template>
	<!-- component -->
<div class="flex items-center justify-center">
    <div class="w-full max-w-md">
      <form class="bg-white shadow-lg rounded px-12 pt-6 pb-8 mb-4" ref="registerform" @submit.prevent="register">
        <!-- @csrf -->
        <div
          class="text-gray-800 text-2xl flex justify-center border-b-2 py-2 mb-4"
        >
           Register
        </div>
        <div class="mb-4">
          <label
            class="block text-gray-700 text-sm font-normal mb-2"
            for="username"
          >
            Name
          </label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            name="name"
            type="text"
            required
            autofocus
            placeholder="Name"
          />

          <label
            class="block text-gray-700 text-sm font-normal mb-2"
            for="username"
          >
            Email
          </label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            name="email"
            type="email"
            required
            autofocus
            placeholder="Email"
          />
        </div>

        <div class="mb-6">
          <label
            class="block text-gray-700 text-sm font-normal mb-2"
            for="password"
          >
            Password
          </label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
            type="password"
            placeholder="Password"
            name="password"
            required
            autocomplete="current-password"
          />
          <label for="rules" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select Type of your Account </label>
        <select v-model="selectedRule" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
  <option v-for="rule in rulesWithDefaultOption" :key="rule.id" :value="rule.id">{{ rule.name }}</option>
</select>
          <input id="file-upload" type="file" name="image" class="hidden" @change="handleImageChange" ref="fileInput">

          <button @click="openFileUploadDialog" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Upload image</span>
                </button>
                <img :src="imagePreview" v-if="imagePreview">
        </div>

        <div class="flex items-center justify-between">
          <button class="px-4 py-2 rounded text-white inline-block shadow-lg bg-blue-500 hover:bg-blue-600 focus:bg-blue-700" type="submit">Sign Up</button>
          <a
            class="inline-block align-baseline font-normal text-sm text-blue-500 hover:text-blue-800"
            href="#"
          >
            Forgot Password?
          </a>
        </div>

      </form>
      <p class="text-center text-gray-500 text-xs">
      </p>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      auth: 'guest',
      image: null,
      rule_id: this.selectedRule,
      imagePreview: null,
      selectedRule: null,
      rules: []
    }
  },
  created() {
    this.fetchRules();
  },
  computed: {
  rulesWithDefaultOption() {
    return [{ id: null, name: 'Type of Account' }, ...this.rules];
  }
},

  methods: {
    openFileUploadDialog() {
      this.$refs.fileInput.click()
    },
    handleImageChange(event) {
      const file = event.target.files[0]
      if (!file) return

      // Create a preview of the selected image
      const reader = new FileReader()
      reader.onload = () => {
        this.imagePreview = reader.result
      }
      reader.readAsDataURL(file)

      this.image = file
    },
    async fetchRules() {
      try {
        const response = await fetch('http://127.0.0.1:8000/api/rules');
        const data = await response.json();
        this.rules = data.rules;
      } catch (error) {
        console.error(error);
      }
    },
    register() {
      try {
        const formData = new FormData(this.$refs.registerform);

        // Append the image file to the form data
        formData.append('image', this.image);
        formData.append('rule_id', this.selectedRule);
        this.$axios.post('http://127.0.0.1:8000/api/register', formData).then(res => {

          alert("تم الأنشاء بنجاح  ")

          this.$router.push({
            path: '/login',
          });
        });
      } catch (err) {
        console.log(err);
      }
    }
  }
}
</script>


