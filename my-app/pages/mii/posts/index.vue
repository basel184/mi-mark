<template>
  <div>
    <div v-if="$auth.loggedIn" class="w-full flex justify-center">
  <div class="w-full flex">
    <div class="w-96 flex-shrink-0" style="display: flex; flex-direction: row-reverse;">
  <SideBar />
</div>
    <div class="w-80% flex-shrink-0" style="width: 529px;margin-left: 30px;"> <MiiPostForm />
      <Post v-for="post in posts" :key="post.id" :post="post" class="max-w-l bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700" />
    </div>
    <div class="flex-grow">

    </div>
  </div>
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
        const response = await this.$axios.get('http://127.0.0.1:8000/api/posts')

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

