<<template>
  <div>
    <form @submit.prevent="handleSubmit">

          <div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600">
             <div class="flex items-center justify-between px-3 py-2 border-b dark:border-gray-600">


                  <div class="flex flex-wrap items-center divide-gray-200 sm:divide-x dark:divide-gray-600">

                  <div class="flex items-center space-x-1 sm:pr-4">
                  <div class="relative z-0 w-full mb-6 group">
                  <input type="input" v-model="title" name="title" id="title" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required >
                  <label for="title" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Title of Post..</label>


                  </div>
             
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Embed map</span>
                </button>


    <!-- Image upload -->
    <input id="image-upload" type="file" name="image" class="hidden" @change="handleImageChange" ref="imageInput">
    <button @click="openImageUploadDialog" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
      <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path>
      </svg>
      <span class="sr-only">Upload image</span>
    </button>

    <!-- Video upload -->
    <input id="video-upload" type="file" name="video" class="hidden" @change="handleVideoChange" ref="videoInput">
    <button @click="openVideoUploadDialog" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
      <svg fill="none" class="w-5 h-5" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
  <path stroke-linecap="round" stroke-linejoin="round" d="M15.91 11.672a.375.375 0 010 .656l-5.603 3.113a.375.375 0 01-.557-.328V8.887c0-.286.307-.466.557-.327l5.603 3.112z"></path>
</svg>
      <span class="sr-only">Upload video</span>
    </button>
    <button @click="openVideoUploadDialog" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">

    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M12 18.75a6 6 0 006-6v-1.5m-6 7.5a6 6 0 01-6-6v-1.5m6 7.5v3.75m-3.75 0h7.5M12 15.75a3 3 0 01-3-3V4.5a3 3 0 116 0v8.25a3 3 0 01-3 3z"></path>
</svg>
</button>
  <template>
    <div>

    </div>
  </template>

<template v-if="showModel"  class="w-20">
  <div style="
    width: auto;
    height: auto;
    position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
" class="modall w-20 bg-gradient-to-r from-blue-300 to-purple-500 h-screen flex justify-center items-center">
    <div class="modall-content max-w-l bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
      <div>
        <button class="close" type="button" @click.prevent="closeModal">&times; Close</button>
            </div>

            <p class="text-lg text-center text-gray-700 mb-8">Hi  <strong>  </strong> Here you can write the type of your mark ..which you chose from select and hit the button   </p>




            <select v-model="selectedActivity" class="form-select">
  <option v-for="activity in activitiesWithDefaultOption" :key="activity.id" :value="activity.id">{{ activity.name }}</option>
</select>
      <select name="status" id="status" v-model="status">
      <option value="" disabled selected>Status</option>
      <option value="public">Public</option>
      <option value="private">Only Me</option>
      <option value="friends">My Friends</option>
    </select>
      <button type="button" @click.prevent="handleSubmit"  class=" inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
          Publish Mark
      </button>
  <div v-if="selectedActivity">
      <h2>Selected Activity:</h2>
      <p>{{ getActivityName(selectedActivity) }}</p>
    </div>
    </div>
  </div>
</template>


                <button @click.prevent="showModel = true" style="width: 210px;" class=" inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
    Publish
</button>
<!--
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                     <span class="sr-only">Format code</span>
                </button>
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM7 9a1 1 0 100-2 1 1 0 000 2zm7-1a1 1 0 11-2 0 1 1 0 012 0zm-.464 5.535a1 1 0 10-1.415-1.414 3 3 0 01-4.242 0 1 1 0 00-1.415 1.414 5 5 0 007.072 0z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Add emoji</span>
                </button>
            </div>
            <div class="flex flex-wrap items-center space-x-1 sm:pl-4">
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Add list</span>
                </button>
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Settings</span>
                </button>
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Timeline</span>
                </button>
                <button type="button" class="p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Download</span>
                </button>
               -->

            </div>

        </div>
        <button type="button" data-tooltip-target="tooltip-fullscreen" class="p-2 text-gray-500 rounded cursor-pointer sm:ml-auto hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
            <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 4a1 1 0 011-1h4a1 1 0 010 2H6.414l2.293 2.293a1 1 0 11-1.414 1.414L5 6.414V8a1 1 0 01-2 0V4zm9 1a1 1 0 010-2h4a1 1 0 011 1v4a1 1 0 01-2 0V6.414l-2.293 2.293a1 1 0 11-1.414-1.414L13.586 5H12zm-9 7a1 1 0 012 0v1.586l2.293-2.293a1 1 0 111.414 1.414L6.414 15H8a1 1 0 010 2H4a1 1 0 01-1-1v-4zm13-1a1 1 0 011 1v4a1 1 0 01-1 1h-4a1 1 0 010-2h1.586l-2.293-2.293a1 1 0 111.414-1.414L15 13.586V12a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
            <span class="sr-only">Full screen</span>
        </button>
        <div id="tooltip-fullscreen" role="tooltip" class="absolute z-10 invisible inline-block px-3 py-2 text-sm font-medium text-white transition-opacity duration-300 bg-gray-900 rounded-lg shadow-sm opacity-0 tooltip dark:bg-gray-700">
            Show full screen
            <div class="tooltip-arrow" data-popper-arrow></div>
        </div>
    </div>
    <div class="px-4 py-2 bg-white rounded-b-lg dark:bg-gray-800">
        <label for="body" class="sr-only">Publish post</label>
        <textarea id="body" v-model="body" rows="3" class="block w-full px-0 text-sm text-gray-800 bg-white border-0 dark:bg-gray-800 focus:ring-0 dark:text-white dark:placeholder-gray-400" placeholder="Write an article..." required></textarea>
    </div>
    <div class="image-upload">
    <div class="image-preview" v-if="imagePreview">
            <img :src="imagePreview" alt="Selected image">
            <button type="button" class="close-button" @click="clearImage">&times;</button>
          </div>
               <div class="image-preview" v-if="selectedVideo">
                <CustomVideoPlayer :src="selectedVideo" v-if="selectedVideo" />
                <button type="button" class="close-button" @click="clearVideo">&times;</button>
            </div>
        </div>

</div>

</form>
  </div>
</template>

<script>
import CustomVideoPlayer from '@/components/CustomVideoPlayer.vue';
export default {
  middleware:'auth',
  components: {
    CustomVideoPlayer,
  },
  data() {
   return {
     title: '',
     body: '',
     status: '',
     activity_id: this.selectedActivity,
     image: '',
     video:'',
      selectedVideo:'',
     post: null,
     showModel:false,

     imagePreview: null,
   // Replace with your own authentication logic
    selectedActivity: null,
      activities: [],
     success: false
   }
 },
 computed: {
  activitiesWithDefaultOption() {
    return [{ id: null, name: 'the Mark mode' }, ...this.activities];
  }
},
 created() {
    this.fetchActivities();
  },
  mounted() {
    this.videoPlayer = this.$refs.videoPlayer;
  },
  methods: {
    closeModal() {
    this.showModel = false;
  },
    async fetchActivities() {
      try {
        const response = await fetch('http://127.0.0.1:8000/api/activities');
        const data = await response.json();
        this.activities = data.activities;
      } catch (error) {
        console.error(error);
      }
    },
    getActivityName(activityId) {
      const activity = this.activities.find(activity => activity.id === activityId);
      return activity ? activity.name : '';
    },

    openImageUploadDialog() {
      this.$refs.imageInput.click();
    },
    openVideoUploadDialog() {
      this.$refs.videoInput.click();
    },

      handleVideoChange(event) {
        const file = event.target.files[0];
      if (file) {
        this.selectedVideo = URL.createObjectURL(file);
        const reader = new FileReader()
      reader.onload = () => {
        this.selectedVideo = reader.result

      }
      reader.readAsDataURL(file)

      this.video = file
      } else {
        this.selectedVideo = null;
      }
    },

    handleImageChange(event) {
      const file = event.target.files[0]
      if (!file) return

      // Create a preview of the selected image
      const reader = new FileReader()
      reader.onload = () => {
        this.imagePreview = reader.result
      }
      reader.readAsDataURL(file)

      this.image = file
    },
    clearImage() {
      this.image = null
      this.imagePreview = null

    },
    clearVideo() {
      this.video = null


    },
   async handleSubmit() {

     const formData = new FormData()
     formData.append('title', this.title)
     formData.append('body', this.body)
     formData.append('status', this.status)
     formData.append('image', this.image)
     formData.append('video', this.video)
     formData.append('activity_id', this.selectedActivity)

    const  response = await this.$axios.post('http://127.0.0.1:8000/api/post', formData , {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    })
     // Handle the response

     if (response) {
      this.post = response.data.post
   //  this.image_url = response.data.image_url
   //  this.user_name = this.$store.state.auth.user.name,
      this.success = response.data.success
      location.reload();
          alert('Post created successfully')
          // Redirect to the new post page
        //  this.$router.push(`/posts/${response.body.id}`)
        this.$router.push(`/mii/posts/`)
        } else {
          alert('Failed to create post')
        }
      },
       catch (error) {
        console.error(error)
        alert('An error occurred while creating the post')
      }
   },
   watch: {
    videoPath() {
      this.videoLoaded = false;
      this.startTime = 0;
      this.endTime = 0;
    }
  }

  }

</script>

<style>
.cen {
  width: 500px;
  height: 260px;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.image-upload {
  position: relative;
}

.image-preview {
  position: relative;
  display: inline-block;
  margin-top: 10px;
  padding: 10px;
  background-color: #f5f5f5;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.close-button {
  position: absolute;
  top: -10px;
  right: -10px;
  width: 20px;
  height: 20px;
  padding: 0;
  margin: 0;
  font-size: 16px;
  line-height: 20px;
  text-align: center;
  background-color: #f5f5f5;
  border: 1px solid #ccc;
  border-radius: 50%;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  cursor: pointer;
}
.modall {
  display: block;
  position: fixed;
  z-index: 99;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
}
.modall-content {
  background-color: #fefefe;
  margin: 5% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}
</style>
