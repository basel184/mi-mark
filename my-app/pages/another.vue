<template>
  <div>


    <div
        class="w-80 h-80 bg-gray-100 border-4 border-gray-400 rounded-lg mb-4 mr-4">
        <div class="flex flex-wrap" style="flex-direction: column;align-items: center;">
  <div class="w-32 h-32 bg-gray-100 border-0 border-white rounded-lg  mr-4" v-for="(image, index) in imageBoxes" :key="index" :ref="'dropZone' + (index + 1)" @dragover.prevent @drop="handleDrop($event, index + 1)" @click="handleImageClick(index + 1)">
    <div v-if="!image" class="h-full flex justify-center items-center">
      <span>Drop image here</span>
    </div>
    <div v-else class="h-full">
      <img :src="image" class="w-full h-full object-cover" />
    </div>
  </div>
</div>

  </div>
    <div class="mb-4">


    </div>

    <button @click="handleAddImage"></button>
    <input type="file" ref="imageInput" @change="handleImageUpload" style="display: none" />
    <div class="flex mt-4">
      <div
        class="w-32 h-32 bg-gray-100 border-4 border-gray-400 rounded-lg mb-4 mr-4"
        v-for="(image, index) in images"
        :key="index"
        :draggable="true"
        @dragstart="handleDragStart($event, image)"
      >
        <img :src="image" class="w-full h-full object-cover" />
      </div>
    </div>
    <div>
      <canvas
        ref="canvas"
        class="border-4 border-gray-400 rounded-lg "
        :width="canvasWidth"
        :height="canvasHeight"
        @click="handleCanvasClick"
      ></canvas>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      images: [
      require('~~/mii/img/images.png'),
        require('~~/mii/img/download (1).png'),
        require('~~/mii/img/downloada.jpg'),
        require('~~/mii/img/shirt.jpg'),
      ],
      imageBoxes: [null, null],
      imageCoordinates: [
      
      ],
      currentImageIndex: null,
      canvasWidth: 500,
      canvasHeight: 500,
      canvasContext: null,
      imageSize: 200,
    };
  },
  mounted() {
    this.canvasContext = this.$refs.canvas.getContext('2d');
    this.handleImageSizeChange();
  },
  methods: {
    handleAddImage() {
      this.$refs.imageInput.click();
    },
    handleImageUpload(event) {
      const file = event.target.files[0];
      const reader = new FileReader();
      reader.onload = () => {
        const img = new Image();
        img.onload = () => {
          this.canvasContext.drawImage(img, 0, 0, this.$refs.canvas.width, this.$refs.canvas.height);
        };
        img.src = reader.result;
      };
      reader.readAsDataURL(file);
    },
    handleImageClick(index) {
      this.currentImageIndex = index;
    },
    handleImageSizeChange() {
      if (this.currentImageIndex === null) {
        return;
      }
      const img = this.imageBoxes[this.currentImageIndex - 1];
      const coordinates = this.imageCoordinates[this.currentImageIndex - 1];
      this.canvasContext.clearRect(0, 0, this.$refs.canvas.width, this.$refs.canvas.height);
      for (let i = 0; i < this.imageBoxes.length; i++) {
        const currentImg = this.imageBoxes[i];
        if (currentImg) {
          const currentCoordinates = this.imageCoordinates[i];
          const currentSize = i === this.currentImageIndex - 1 ? this.imageSize : 200;
          this.canvasContext.drawImage(currentImg, currentCoordinates.x, currentCoordinates.y, currentSize, currentSize);
        }
      }
    },
    handleCanvasClick(event) {
      if (this.currentImageIndex === null) {
        return;
      }
      const coordinates= this.getCanvasCoordinates(event);
      this.imageCoordinates[this.currentImageIndex - 1] = coordinates;
      this.handleImageSizeChange();
      this.currentImageIndex = null;
    },
    handleDrop(event, index) {
      event.preventDefault();
      const file = event.dataTransfer.files[0];
      const reader = new FileReader();
      reader.onload = () => {
        this.imageBoxes.splice(index - 1, 1, reader.result);
        this.handleImageSizeChange();
      };
      reader.readAsDataURL(file);
    },
    getCanvasCoordinates(event) {
      const canvasRect = this.$refs.canvas.getBoundingClientRect();
      const x = event.clientX - canvasRect.left;
      const y = event.clientY - canvasRect.top;
      return { x, y };
    },
    handleDragStart(event, image) {
      event.dataTransfer.setData('text/plain', image);
    },
  },
};
</script>

<style>
canvas {
  width: 500px;
  height: 500px;
}
</style>
