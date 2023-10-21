<template>
  <div>
    <h1>dsfffff</h1>
    <h2>{{ post.title }}</h2>
    <p>{{ post.body }}</p>
    <CommentList :postId="post.id" :comments="comments" />
    <CommentForm :postId="post.id" />
  </div>
</template>

<script>


export default {
  props: {
    post: {
      type: Object,
      required: true
    }
  },
  components: {
    CommentForm,
    CommentList
  },
  async asyncData({ $axios, params }) {
    const [postResponse, commentResponse] = await Promise.all([
      $axios.get(`/api/posts/${params.id}`),
      $axios.get(`/api/posts/${params.id}/comments`)
    ])
    return {
      post: postResponse.data,
      comments: commentResponse.data
    }
  }
}
</script>
