<template>
	<!-- component -->
  <div class="flex flex-wrap items-center justify-center w-full">
  <div class="w-full md:w-2/5 h-96 mt-10 flex justify-end">
    <img src="~~/mii/img/logo.png" alt="your-image-alt" class="w-4/5">
  </div>
  <div class="w-full md:w-3/5 max-w-md mt-10 flex justify-start">
    <form class="bg-white shadow-lg rounded px-12 pt-6 pb-8 mb-4 w-4/5 md:w-full" ref="loginform" @submit.prevent="userLogin()">
        <!-- @csrf -->
        <ErrorAlert :error="errMsg" />
        <div
          class="text-gray-800 text-2xl flex justify-center border-b-2 py-2 mb-4"
        >
           Login
        </div>
        <div class="mb-4">
          <label
            class="block text-gray-700 text-sm font-normal mb-2"
            for="username"
          >
            Email
          </label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            v-model="form.email"
            name="email"

            type="email"
            required
            autofocus
            placeholder="Email"
          />
        </div>
        <ErrorsAlert :errors="errors" field="code" />
        <div class="mb-6">
          <label
            class="block text-gray-700 text-sm font-normal mb-2"
            for="password"
          >
            Password
          </label>
          <input
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
            v-model="form.password"
              :type="showPassword1 ? 'text' : 'password'"
            placeholder="Password"
            name="password"
            required
            autocomplete="current-password"
          />
        </div>
        <div class="flex items-center justify-between">
          <button class="px-4 py-2 rounded text-white inline-block shadow-lg bg-blue-500 hover:bg-blue-600 focus:bg-blue-700" type="submit">Sign In</button>
          <a
            class="inline-block align-baseline font-normal text-sm text-blue-500 hover:text-blue-800"
            href="#"
          >
            Forgot Password?
          </a>
        </div>
      </form>

  </div>
</div>
</template>
<script>
export default {
  layout: 'custom',
  middleware: ['guest'],

  data() {
    return {
      form: {
        email: '',
        password: '',
        loggedIn: true,
      },
      showPassword1: false,
      errMsg: '',
      errors: {},
    }
  },

  head() {
    return {
      title: this.$t('loginPage.login'),
    }
  },

  methods: {
    async userLogin() {
      try {
        const user = await this.$auth.loginWith('local', { data: this.form })
        if (user) {
          console.log('User is logged in', this.$auth.$state)
}
        alert("تم التسجيل ")
this.$router.push(this.localePath('/mii/posts'))


      } catch (error) {
        if (error.response.data.message)
          this.errMsg = error?.response?.data?.message
        if (error.response.data.errors)
          this.errors = error?.response?.data?.errors
      }

    },

  },
  logout() {
      this.$store.dispatch('logout');
    },
}
</script>
const user = await this.$auth.loginWith('local', {
  data: {
    email: this.form.email,
    password: this.form.password
  }
})


