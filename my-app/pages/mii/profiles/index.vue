<template>
  <div >

   baaaaaaaaaaaaaaaaa
   {{user.name}}
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: [],
    };
  },
  async fetch() {

    const response = await this.$axios.$get(`http://127.0.0.1:8000/api/user`);
    this.user = response.data;
  },

};
</script>
