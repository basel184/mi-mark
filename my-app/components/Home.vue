<template>
  <div>

    <div class="relative h-32">

  <img class="absolute inset-0 object-cover w-full h-full " src="~~/mii/img/bbbd.png/">
  <div class="relative z-10 flex items-center justify-center h-full">
    <div class="flex items-center justify-center w-full">
  <form action="/search" class="relative w-full max-w-md">
    <label for="search-input" class="sr-only">Search</label>
    <div class="relative">
      <input type="text" id="search-input" placeholder="Search..." class="block w-full py-2 pr-10 pl-4 leading-5 text-gray-900 placeholder-gray-500 bg-white border border-gray-300 rounded-md focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500 focus:ring-opacity-50">
      <button type="submit" aria-label="Search" class="absolute top-0 right-0 px-3 py-2 text-gray-500 rounded-md focus:outline-none focus:text-gray-900">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8"></circle>
          <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
      </button>
    </div>
    <!--
    <button type="button" aria-label="Voice Search" class="ml-2 text-gray-500 rounded-md focus:outline-none focus:text-gray-900">
      <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 2c-3.31 0-6 2.69-6 6v7a6 6 0 0 0 12 0v-7c0-3.31-2.69-6-6-6z"></path>
        <path d="M19 10v2a7 7 0 0 1-14 0v-2"></path>
        <line x1="12" y1="19" x2="12" y2="23"></line>
        <line x1="8" y1="23" x2="16" y2="23"></line>
      </svg>
    </button>
    -->
  </form>
</div>

    <Drawer />

  </div>

</div>
  <div class="container mx-auto">
  <div class="w-95">
    <div class="flex flex-row">
      <div class="w-1/4 bg-green-300 px-1 pt-2 pb-1"><Card /></div>
      <div class="w-1/4 bg-red-300 px-1 pt-2 pb-1"><Card /></div>
      <div class="w-1/2 bg-blue-300">
          <Carsoul />
      </div>

    </div>
  </div>
</div>
</div>
</template>

<script>
import Carsoul from '~/components/Carsoul.vue';
import Card from '~/components/Card.vue';
import Drawer from '~/components/Drawer.vue';
export default {
  components: {
    Carsoul,
    Card,
    Drawer
},}
  </script>
<style scoped>
.search-container {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.search-input {
  width: 70%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 0.25rem 0 0 0.25rem;
  outline: none;
}

.search-icon {
  background-color: #ccc;
  border: none;
  border-radius: 0 0.25rem 0.25rem 0;
  padding: 0.5rem;
  cursor: pointer;
}
@media (min-width: 640px) {
  .max-w-md {
    max-width: 28rem;
  }
}

@media (min-width: 768px) {
  .max-w-md {
    max-width: 32rem;
  }
}

@media (min-width: 1024px) {
  .max-w-md {
    max-width: 36rem;
  }
}

@media (min-width: 1280px) {
  .max-w-md {
    max-width: 42rem;
  }
}

@media (min-width: 1536px) {
  .max-w-md {
    max-width: 48rem;
  }
}

input::-webkit-input-placeholder {
  opacity: 1;
}

input::-moz-placeholder {
  opacity: 1;
}

input:-ms-input-placeholder {
  opacity: 1;
}

input::-ms-input-placeholder {
  opacity: 1;
}

input::placeholder {
  opacity: 1;
}
</style>
