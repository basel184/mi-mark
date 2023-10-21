<template>
  <div
    class="card" style="width: 150px; height: 160px;"
    :class="{ 'selected': card.selected }"
    @click="$emit('selected', card)"
  >
    <div class="card-image">

    <img :src="card.selected ? card.hoverImage : card.image" :alt="card.name" />
      <div class="card-hover-image">
        <img :src="card.hoverImage" :alt="card.name" />
      </div>
    </div>
    <div class="card-content" style="text-align: center; display: flex; flex-direction: column; justify-content: center; align-items: center; position: relative; bottom: 14px ;">
  <h2 class="text-sm font-sans font-semibold" >{{ card.name }}</h2>
  <p>{{ card.description }}</p>
</div>
  </div>
</template>

<script>
export default {
  middleware:'auth',
  props: {
    card: Object,
  },
};
</script>

<style scoped>
.card {
  display: inline-block;
  position: relative;
  width: 200px;
  margin-right: 20px;
  margin-bottom: 20px;
  border: 1px solid rgb(224, 222, 222);
  border-radius: 20px;
  overflow: hidden;
  cursor: pointer;
  transition: border-color 0.4s ease-in-out;
}

.card:hover {
  border-color: rgb(24, 53, 105);
}

.card.selected {
  border: 2px solid rgb(2, 190, 12);
}

.card-image {
  position: relative;
}

.card-image img {
  display: block;
  width: 100%;
  height: auto;
}

.card-hover-image {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
  transition: opacity 0.2s ease-in-out;
}

.card:hover .card-hover-image {
  opacity: 1;
}
</style>
