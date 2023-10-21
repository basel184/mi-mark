<template>
  <div>
    <div v-if="recording">{{ timer }}</div>
    <button @click="toggleRecording" :disabled="recording">Start Recording</button>
    <button @click="toggleRecording" :disabled="!recording">Stop Recording</button>
    <button @click="saveRecording" :disabled="!audioBlob">Save Recording</button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      recording: false,
      audioBlob: null,
      timer: '00:00:00',
      startTime: null,
      timerInterval: null,
    };
  },
  methods: {
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
};
</script>
