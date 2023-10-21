
<template>
  <div class="flex justify-between items-center h-screen relative">
    <div class="w-1/4 flex flex-col justify-center items-center">
      <div
        class="w-32 h-32 bg-gray-100 border-4 border-gray-400 rounded-lg mb-4"
        ref="dropZone1"
        @dragover.prevent
        @drop="handleDrop($event, 1)"
      >
        <div v-if="!images[0]" class="h-full flex justify-center items-center">
          <span>Drop image here</span>
        </div>
        <div v-else class="h-full flex justify-center items-center">
          <img :src="images[0]" class="max-h-full max-w-full" />
        </div>
      </div>
      <div
        class="w-32 h-32 bg-gray-100 border-4 border-gray-400 rounded-lg mb-4"
        ref="dropZone2"
        @dragover.prevent
        @drop="handleDrop($event, 2)"
      >
        <div v-if="!images[1]" class="h-full flex justify-center items-center">
          <span>Drop image here</span>
        </div>
        <div v-else class="h-full flex justify-center items-center">
          <img :src="images[1]" class="max-h-full max-w-full" />
        </div>
      </div>
      <div
        class="w-32 h-32 bg-gray-100 border-4 border-gray-400 rounded-lg mb-4"
        ref="dropZone3"
        @dragover.prevent
        @drop="handleDrop($event, 3)"
      >
        <div v-if="!images[2]" class="h-full flex justify-center items-center">
          <span>Drop image here</span>
        </div>
        <div v-else class="h-full flex justify-center items-center">
          <img :src="images[2]" class="max-h-full max-w-full" />
        </div>
      </div>
    </div>
    <div class="w-3/4 relative">
      <div
        v-for="(coordinates, index) in imageCoordinates"
        :key="index"
        class="absolute flex justify-center items-center"
        :style="{ top: coordinates.y + 'px', left: coordinates.x + 'px' }"
      >

      </div>
      <canvas ref="canvas" width="800" height="600"></canvas>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      images: [
      require('~~/mii/img/images.png'),
        require('~~/mii/img/downloada.jpg'),

      ], // تم تعديل الحجم لـ 3 صور.
      canvasContext: null,
      imageCoordinates: [
        { x: 100, y: 100 },
        { x: 100, y: 300 },
        { x: 250, y: 300 },
      ],
      currentImageIndex: null,
    };
  },
  methods: {
    handleDrop(event, index) {
      event.preventDefault();
      const file = event.dataTransfer.files[0];
      const reader = new FileReader();
      reader.onload = () => {
        const img = new Image();
        img.onload = () => {
          const coordinates = this.imageCoordinates[index - 1];
          this.images[index - 1] = img; // تم تخزين الصور المسحوبة بدلاً من عناوين URL.
          this.canvasContext.drawImage(img, coordinates.x, coordinates.y, 200, 200);
          const message = `Image ${index} was successfully dropped`;
          this.$refs['dropZone' + index].querySelector('span').innerText = message;
        };
        img.src = reader.result;
      };
      reader.readAsDataURL(file);
      this.currentImageIndex = index;
    },
    handleDragStart(event, image) {
      event.dataTransfer.setData('text/plain', image);
    },
    handleCanvasClick(event) {
      if (this.currentImageIndex === null) {
        return;
      }
      const coordinates= this.getCanvasCoordinates(event);
      const img = this.images[this.currentImageIndex - 1];
      this.canvasContext.drawImage(img, coordinates.x, coordinates.y, 200, 200);
      this.imageCoordinates[this.currentImageIndex - 1] = coordinates;
      this.currentImageIndex = null;
    },
    getCanvasCoordinates(event) {
      const canvasRect = this.$refs.canvas.getBoundingClientRect();
      const x = event.clientX - canvasRect.left;
      const y = event.clientY - canvasRect.top;
      return { x, y };
    },
    handleCanvasWheel(event) {
      event.preventDefault();
      const coordinates = this.getCanvasCoordinates(event);
      const scaleFactor = 1.1;
      const delta = event.wheelDelta ? event.wheelDelta / 40 : event.deltaY ? event.deltaY : 0;
      if (delta < 0) {
        this.canvasContext.scale(1 / scaleFactor, 1 / scaleFactor);
      } else {
        this.canvasContext.scale(scaleFactor, scaleFactor);
      }
      this.canvasContext.clearRect(0, 0, this.$refs.canvas.width, this.$refs.canvas.height);
      for (let i = 0; i < this.images.length; i++) {
        const currentImg = this.images[i];
        if (currentImg) {
          const currentCoordinates = this.imageCoordinates[i];
          this.canvasContext.drawImage(currentImg, currentCoordinates.x, currentCoordinates.y, 200, 200);
        }
      }
    },
  },
  mounted() {
    this.canvasContext = this.$refs.canvas.getContext('2d');
    this.$refs.canvas.addEventListener('click', this.handleCanvasClick);
    this.$refs.canvas.addEventListener('wheel', this.handleCanvasWheel);
  },
};
</script>


<style>
canvas {
  border: 4px solid black;
  border-radius: 4px;
}
</style>
