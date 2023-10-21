<template>
  <div class="relative max-w-screen-md mx-auto">
    <div class="aspect-w-16 aspect-h-9">
      <video ref="videoPlayer" :src="src" @loadedmetadata="handleLoadedMetadata" @timeupdate="handleTimeUpdate"
        class="w-full h-full object-cover"></video>
      <div class="video-controls absolute bottom-0 left-0 right-0 bg-black bg-opacity-50 p-4 flex items-center justify-between"
        :class="{ 'opacity-100 pointer-events-auto': showControls }" @mouseover="showControlBar"
        @mouseleave="hideControlBar">
        <div class="flex items-center space-x-4">
          <button @click="togglePlayPause" class="text-white text-2xl focus:outline-none">
            <i :class="isPlaying ? 'fas fa-pause' : 'fas fa-play'"></i>
          </button>
          <div class="text-white">
            <span>{{ formattedTime(currentTime) }}</span>
            <span>/</span>
            <span>{{ formattedTime(duration) }}</span>
          </div>
        </div>
        <div class="flex items-center space-x-4">
          <div class="w-48">
            <input type="range" class="w-full" min="0" :max="duration" v-model="currentTime"
              @input="handleTimeChange" />
          </div>
          <button @click="toggleMute" class="text-white text-2xl focus:outline-none">
            <i :class="isMuted ? 'fas fa-volume-mute' : 'fas fa-volume-up'"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    src: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      currentTime: 0,
      duration: 0,
      isPlaying: false,
      isMuted: false,
      showControls: false,
    };
  },
  computed: {
    progressBarWidth() {
      return (this.currentTime / this.duration) * 100 + '%';
    },
  },
  mounted() {
    const videoPlayer = this.$refs.videoPlayer;
    videoPlayer.addEventListener('loadedmetadata', this.handleLoadedMetadata);
    videoPlayer.addEventListener('timeupdate', this.handleTimeUpdate);
  },
  beforeUnmount() {
    const videoPlayer = this.$refs.videoPlayer;
    videoPlayer.removeEventListener('loadedmetadata', this.handleLoadedMetadata);
    videoPlayer.removeEventListener('timeupdate', this.handleTimeUpdate);
  },
  methods: {
    handleLoadedMetadata() {
      const videoPlayer = this.$refs.videoPlayer;
      this.duration = videoPlayer.duration;
    },
    handleTimeUpdate() {
      const videoPlayer = this.$refs.videoPlayer;
      this.currentTime = videoPlayer.currentTime;
    },
    handleTimeChange() {
      const videoPlayer = this.$refs.videoPlayer;
      videoPlayer.currentTime = this.currentTime;
    },
    togglePlayPause() {
      const videoPlayer = this.$refs.videoPlayer;
      if (videoPlayer.paused) {
        videoPlayer.play();
        this.isPlaying = true;
      } else {
        videoPlayer.pause();
        this.isPlaying = false;
      }
    },
    toggleMute() {
      const videoPlayer = this.$refs.videoPlayer;
      videoPlayer.muted = !videoPlayer.muted;
      this.isMuted = videoPlayer.muted;
    },
    formattedTime(time) {
      const minutes = Math.floor(time / 60);
      const seconds = Math.floor(time % 60);
      return `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    },
    showControlBar() {
      this.showControls = true;
    },
    hideControlBar() {
      this.showControls = false;
    },
  },
};
</script>

<style>
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');
</style>
