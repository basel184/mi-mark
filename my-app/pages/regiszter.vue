<template>
  <v-container class="text-center">
    <v-row :align="'center'"
           :justify="'center'" class="mt-12">
      <v-col cols="12" md="6" lg="3">
      </v-col>
    </v-row>
    <snack-bar :snackbar-message.sync="snackbarMessage"></snack-bar>
  </v-container>
</template>
<script>

import SnackBar from '@/components/snackBar'

export default {
  components: { AuthenticationForm, SnackBar },
  data: () => ({
    form: {
      valid: false,
      email: '',
      password: '',
      finish: false
    },
    snackbarMessage: ''
  }),
  computed: {
    finish () {
      return this.form.finish
    }
  },
  watch: {
    finish (newVal) {
      if (newVal) {
        this.register()
        this.form.finish = false
      }
    }
  },
  methods: {
    async register () {
      try {
        await this.$axios.post('/api/auth/register', {
          email: this.form.email,
          password: this.form.password
        })

        const user = await this.$auth.loginWith('local', {
          data: {
            email: this.form.email,
            password: this.form.password
          }
        })

        if (user) {
          await this.$router.push('/admin')
        }

      } catch (error) {
        this.snackbarMessage = error.response.data.message
      }
    }
  }
}
</script>
