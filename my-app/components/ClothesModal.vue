<template>
  <div class="dropzone"
    @dragover.prevent
    @drop="handleDrop"
    @dragenter="dragging = true"
    @dragleave="dragging = false"
    :class="{ 'dragging': dragging }">
    <slot></slot>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dragging: false
    };
  },
  methods: {
    handleDrop(e) {
      e.preventDefault();
      this.dragging = false;
      const image = e.dataTransfer.getData('text/html');
      this.$emit('drop', image);
    }
  }
};
</script>

<style scoped>
.dropzone {
  width: 200px;
  height: 200px;
  border: 2px dashed #ccc;
  border-radius: 10px;
  padding: 10px;
  margin: 10px;
}

.dragging {
  opacity: 0.5;
}
</style>
