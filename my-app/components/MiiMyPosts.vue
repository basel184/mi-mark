<template>
  <div>
    <div v-if="$auth.loggedIn" class="w-full flex justify-center">
     <div class="w-full lg:w-5/12 flex justify-between">
       <div class="w-22%"> </div>
         <div class="w-55%">

       <Post v-for="post in posts" :key="post.id" :post="post" class="max-w-l bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700" />

      </div>
     </div>
   <div class="w-22%"></div>
 </div>
 </div>
</template>

<script>
import Post from '@/components/Post.vue'

export default {
  created() {
      this.fetchPosts()
    },
    methods: {
  async fetchPosts() {
        const response = await this.$axios.get('http://127.0.0.1:8000/api/myposts')

        // Handle the response
        this.posts = response.data.posts
      }},
  components: {
    Post
  },

  data() {
    return {
      posts: []
    }
  }
}
</script>

