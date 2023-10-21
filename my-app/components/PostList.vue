<template>

          <div v-if="$auth.loggedIn" class="w-full flex justify-center">
            <div class="w-full lg:w-5/12 flex justify-between">
              <div class="w-22%"></div>
              <div class="w-55%">
                <div class="max-w-l bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
              <a href="#">
                  <img :src="post.image" class="rounded-t-lg"  alt="" />
              </a>
              <div class="p-5">
                  <a href="#">
                      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{{ post.title }}</h5>
                  </a>
                  <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">{{ post.body }}</p>

              </div>

          <CommentList />


    </div>
    </div>
    <div class="w-22%"></div>
  </div>
</div>


  </template>

  <script>
  export default {
    middleware:'auth',
    data() {
      return {
        posts: []
      }
    },
    created() {
      this.fetchPosts()
    },
    methods: {
      async fetchPosts() {
        const response = await this.$axios.get('http://127.0.0.1:8000/api/posts')

        // Handle the response
        this.posts = response.data.posts
      }
    }
  }
  </script>
