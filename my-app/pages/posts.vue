<template>
  <div v-if="posts">
   <h2>{{ post.title }}</h2>
   <p>{{ post.content }}</p>
   <img :src="image_url" />
 </div>

 
 <form v-else @submit.prevent="handleSubmit">
   <div>
     <label for="title">Title</label>
     <input type="text" id="title" v-model="title" />
   </div>
   <div>
     <label for="body">Content</label>
     <textarea id="body" v-model="body"></textarea>
   </div>
   <div>
     <label for="image">Image</label>
     <input type="file" id="image" @change="handleImageChange" />
   </div>
   <button type="submit">Submit</button>
 </form>

</template>

<script>
export default {
 data() {
   return {
     title: '',
     body: '',
     image: null,
     post: null,
     image_url: null,
     success: false
   }
 },
 methods: {
   handleImageChange(event) {
     this.image = event.target.files[0]
   },
   async handleSubmit() {
     const formData = new FormData()
     formData.append('title', this.title)
     formData.append('body', this.body)
     formData.append('image', this.image)
    const  response = await this.$axios.post('http://127.0.0.1:8000/api/post', formData)
     // Handle the response
     this.post = response.data.post
     this.image_url = response.data.image_url
     this.success = response.data.success
   }
 }
}
</script>

