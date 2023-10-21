<template>
  <span v-if="errors[field]">
    <small
      v-for="(error, index) in errors[field]"
      :key="index * 116200"
      dir="ltr"
      class="text-danger"
    >
      {{ error }}
      <br />
    </small>
  </span>
</template>
<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  name: 'ErrorsAlert',
  props: {
    errors: {
      required: true,
      type: Object,
    },
    field: {
      required: true,
      type: String,
    },
  },
})
</script>
