<template>

<form @submit.prevent="submitComment">

    <label for="body" class="sr-only">Your comment</label>
    <div class="border rounded-md flex items-center px-3 py-2 rounded-lg bg-gray-50 dark:bg-gray-700">

      <button @click="toggleRecording" :disabled="recording" style="position: relative; left:10px ;" type="button" class="inline-flex justify-center p-2 text-gray-500 rounded-lg cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M12 18.75a6 6 0 006-6v-1.5m-6 7.5a6 6 0 01-6-6v-1.5m6 7.5v3.75m-3.75 0h7.5M12 15.75a3 3 0 01-3-3V4.5a3 3 0 116 0v8.25a3 3 0 01-3 3z"></path>
</svg>            <span class="sr-only">Upload image</span>
        </button>


        <input type="hidden" name="post_id" :value="postId" />
        <textarea v-model="body" id="body" rows="1" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Your message..."></textarea>

        <button type="submit" class="inline-flex justify-center p-2 text-blue-600 rounded-full cursor-pointer hover:bg-blue-100 dark:text-blue-500 dark:hover:bg-gray-600">
            <svg aria-hidden="true" class="w-6 h-6 rotate-90" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z"></path></svg>
            <span class="sr-only">Send message</span>
        </button>
    </div>
    <div >

    <emoji-picker @emoji="insert" :search="search">
      <div class="emoji-invoker" slot="emoji-invoker" slot-scope="{ events: { click: clickEvent } }" @click.stop="clickEvent">

        <button style="position: relative; bottom:50px ;" type="button" class="p-2 text-gray-500 rounded-lg cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
            <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM7 9a1 1 0 100-2 1 1 0 000 2zm7-1a1 1 0 11-2 0 1 1 0 012 0zm-.464 5.535a1 1 0 10-1.415-1.414 3 3 0 01-4.242 0 1 1 0 00-1.415 1.414 5 5 0 007.072 0z" clip-rule="evenodd"></path></svg>
            <span class="sr-only">Add emoji</span>
        </button>

      </div>
      <div slot="emoji-picker" slot-scope="{ emojis, insert, display }">
        <div>

          <div class="floating-menu">

    <ul class="category-tabs">
      <li v-for="(emojiGroup, category) in emojis" :key="category">
        <a href="#" @click="changeCategory(category)">
          {{ category }}
        </a>
      </li>
    </ul>

  <div class="emoji-container">
    <div v-for="(emojiGroup, category) in emojis" :key="category" v-show="currentCategory === category">
      <h5>{{ category }}</h5>
      <div>
        <a
          v-for="(emoji, emojiName) in emojiGroup"
          :key="emojiName"
          @click="insert(emoji)"
          :title="emojiName"
        >{{ emoji }}</a>
      </div>
    </div>
  </div>
</div>
        </div>
      </div>

    </emoji-picker>
    <div v-if="recording" style="margin-top: -44px;">
      <button @click="toggleRecording" :disabled="!recording">
        <svg style="
    position: relative;
    top: 5px;
" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M21 7.5V18M15 7.5V18M3 16.811V8.69c0-.864.933-1.406 1.683-.977l7.108 4.061a1.125 1.125 0 010 1.954l-7.108 4.061A1.125 1.125 0 013 16.811z" />
</svg>
</button>
      {{ timer }}</div>
  </div>
</form>

</template>

<script>
import EmojiPicker from 'vue-emoji-picker';
export default {
  components: {
    EmojiPicker
  },
  props: {
    postId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      emojis: {
        // your emoji data here
      },
      currentCategory: '',
      comment: '',
      user_id: this.$store.state.auth.user.id,
      body:'',
      search: '',
      recording: false,
      audioBlob: null,
      timer: '00:00:00',
      startTime: null,
      timerInterval: null,
    }
  },
  methods: {
    changeCategory(category) {
      // logic to handle changing the current category
      this.currentCategory = category;
    },

    insert(emoji) {
      this.body += emoji;
    },
    async submitComment() {
      const data = {
        post_id: this.postId,
        body: this.body,
        user_id: this.user_id
      }
      await this.$axios.post('http://127.0.0.1:8000/api/comments', data)
      // Handle success and error cases
    },
    async toggleRecording() {
      try {
        if (this.recording) {
          await this.stopRecording();
        } else {
          await this.startRecording();
        }
      } catch (error) {
        console.error(error);
      }
    },
    async startRecording() {
      try {
        this.recording = true;
        this.startTime = new Date();
        this.timerInterval = setInterval(this.updateTimer, 1000);

        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        const mediaRecorder = new MediaRecorder(stream);
        const chunks = [];

        mediaRecorder.addEventListener('dataavailable', (e) => {
          chunks.push(e.data);
        });

        mediaRecorder.addEventListener('stop', () => {
          const blob = new Blob(chunks, { type: 'audio/webm' });
          this.audioBlob = blob;
        });

        mediaRecorder.start();
        this.mediaRecorder = mediaRecorder;
      } catch (error) {
        console.error(error);
      }
    },
    async stopRecording() {
      try {
        this.recording = false;
        clearInterval(this.timerInterval);

        if (this.mediaRecorder && this.mediaRecorder.state === 'recording') {
          this.mediaRecorder.stop();
        }
      } catch (error) {
        console.error(error);
      }
    },
    updateTimer() {
      const currentTime = new Date();
      const timeDiff = Math.floor((currentTime - this.startTime) / 1000);

      const hours = Math.floor(timeDiff / 3600);
      const minutes = Math.floor((timeDiff % 3600) / 60);
      const seconds = timeDiff % 60;

      this.timer = `${this.padTime(hours)}:${this.padTime(minutes)}:${this.padTime(seconds)}`;
    },
    padTime(value) {
      return value.toString().padStart(2, '0');
    },
    async saveRecording() {
      try {
        const formData = new FormData();
        formData.append('audio', this.audioBlob);

        const response = await axios.post('http://your-api-endpoint', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        });

        console.log(response.data); // Handle success response
      } catch (error) {
        console.error(error); // Handle error
      }
    },
    async mounted() {
    try {
      const permission = await navigator.permissions.query({ name: 'microphone' });
      if (permission.state === 'granted') {
        // Microphone permission already granted
      } else if (permission.state === 'prompt') {
        // Microphone permission not yet granted, ask the user for permission
        await navigator.mediaDevices.getUserMedia({ audio: true });
      } else {
        // Microphone permission denied
        console.log('Microphone permission denied');
      }
    } catch (error) {
      console.error(error);
    }
  },

  }
}
</script>
<style>
  .floating-menu {

    width: 495px;
    /* float: right; */
    background-color: white;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: relative;
    left: 30px;
    top: -36px;
  }
.category-tabs {
  list-style-type: none;
  display: flex;
  justify-content: space-between;
  padding: 0;
}

.category-tabs li {
  margin-right: 10px;
}

.category-tabs a {
  text-decoration: none;
  color: #333;
}

.emoji-container {
  max-height: 100px;
  overflow-y: auto;
}
.container {
  display: flex;
  align-items: center;
}

.textarea-wrapper {
  position: relative;
  flex: 1;
}

.microphone-icon {
  position: absolute;
  top: 50%;
  left: 10px;
  transform: translateY(-50%);
  width: 16px;
  height: 16px;
  /*background-image: url(path/to/microphone-icon.png); /* Replace with the path to your microphone icon image */
  background-repeat: no-repeat;
  background-position: left center;
  background-size: 100% auto;
  pointer-events: none;
}
</style>
