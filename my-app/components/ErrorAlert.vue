<template>
  <div v-if="error" class="alert alert-danger text-center" role="alert">
    {{ error }}
  </div>
</template>
<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'ErrorAlert',
  props: {
    error: {
      required: true,
      type: String,
    },
  },
})
</script>
