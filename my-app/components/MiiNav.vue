<template>

<nav  v-if="!$auth.loggedIn" class=" fixed top-0 left-0 -mt-3 z-50 w-full h-16 bg-gray-600 border-t border-gray-200 dark:bg-gray-700 dark:border-gray-600">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
  <a href="/" class="flex items-center">
    <div v-if="!$auth.loggedIn" >
      <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">MiiMark</span>
    </div>

  </a>
  <div  class="flex items-center md:order-2">

        <NuxtLink v-if="!$auth.loggedIn" to='/login' class="p-2 mr-1 bg-green-600 text-white rounded" aria-current="page">Login</NuxtLink>


        <NuxtLink v-if="!$auth.loggedIn" to='/register' class="p-2 bg-green-600 text-white rounded">Register</NuxtLink>


  </div>
  <div  class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="mobile-menu-2">
<ul class="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-600 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-gray-600 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
  <li v-if="!$auth.loggedIn">
    <a href="#" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500">Home</a>
  </li>
  <li v-if="$auth.loggedIn">
    <nuxt-link :to="{ path: '/' }" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700" :class="{ 'text-sky-400': $route.path === '/', '': $route.path !== '/' }" :aria-current="$route.path === '/' ? 'page' : null">Welcome</nuxt-link>
  </li>
  <li v-if="$auth.loggedIn">
    <nuxt-link :to="{ path: '/garden-print' }" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700" :class="{ 'text-sky-400': $route.path === '/garden-print', '': $route.path !== '/garden-print' }" :aria-current="$route.path === '/garden-print' ? 'page' : null">Garden Print</nuxt-link>
  </li>
  <li v-if="$auth.loggedIn">
    <nuxt-link :to="{ path: '/mii/addMark' }" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700" :class="{ 'text-sky-400': $route.path === '/mii/addMark', '': $route.path !== '/mii/addMark' }" :aria-current="$route.path === '/mii/addMark' ? 'page' : null">Make Mark</nuxt-link>
  </li>
  <li v-if="$auth.loggedIn">
    <nuxt-link :to="{ path: '/public-fingerprinting' }" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700" :class="{ 'text-sky-400': $route.path === '/public-fingerprinting', '': $route.path !== '/public-fingerprinting' }" :aria-current="$route.path === '/public-fingerprinting' ? 'page' : null">Public Fingerprinting</nuxt-link>
  </li>
  <li v-if="$auth.loggedIn">
    <nuxt-link :to="{ path: '/library' }" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700" :class="{ 'text-blue-400': $route.path === '/library', '': $route.path !== '/library' }" :aria-current="$route.path === '/library' ? 'page' : null">Library</nuxt-link>
  </li>
</ul>

  </div>

  </div>
</nav>
</template>
<script setup>
import { onMounted } from 'vue'
import { Dropdown } from 'flowbite'
onMounted(() => {
   // set the dropdown menu element
    const $targetEl = document.getElementById('dropdownMenu');
    // set the element that trigger the dropdown menu on click
    const $triggerEl = document.getElementById('dropdownButton');
    // options with default values
    const options = {
    placement: 'bottom',
    offsetSkidding: 0,
    offsetDistance: 10,
    onHide: () => {
        console.log('dropdown has been hidden');
    },
    onShow: () => {
        console.log('dropdown has been shown');
    }
    };
    if ($targetEl) {
        /*
        * targetEl: required
        * triggerEl: required
        * options: optional
        */
        const dropdown = new Dropdown($targetEl, $triggerEl, options);
        // show the dropdown
        dropdown.show();
    }
})

</script>
