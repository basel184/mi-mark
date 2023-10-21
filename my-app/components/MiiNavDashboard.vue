<template>
<div 	v-if="$auth.loggedIn" class="flex justify-center items-center shadow-lg fixed top-0 left-0 z-50 w-full h-16 bg-white border-t border-gray-200 dark:bg-gray-700 dark:border-gray-600">

<div class="w-1/4 flex justify-center items-center">
<!-- content for the third div goes here -->

<a href="#" class="flex items-center">
      <img src="~~/mii/img/logo.png/" class="h-8 mr-3" alt=" Logo" />
      <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">MiiMark</span>
  </a>

</div>
<div class="w-2/4 flex justify-center items-center">

  <div class="w-full items-center  relative top-1 ">
    <div class="grid h-full max-w-lg grid-cols-4 mx-auto font-medium ">
      <button @click="setActiveButton('page1'); navigateToPage1()" type="button" :class="{ 'bg-white text-blue-600': activeButton === 'page1', ' text-white ': activeButton !== 'page1' }" class="inline-flex flex-col items-center justify-center px-5  border-gray-200 border-x hover:bg-gray-50 dark:hover:bg-gray-800 group dark:border-gray-600">
       <svg class="rounded-md bg-emerald-500 w-11 group-hover:text-blue-600 dark:group-hover:text-blue-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"></path>

</svg>
Home

        </button>
        <button  @click="setActiveButton('page2'); navigateToPage2()" type="button" :class="{ 'bg-white text-blue-600': activeButton === 'page2', ' text-white': activeButton !== 'page2' }" class="inline-flex flex-col items-center justify-center px-5 border-r border-gray-200 hover:bg-gray-50 dark:hover:bg-gray-800 group dark:border-gray-600">

          <svg class="rounded-md bg-emerald-500 w-11 group-hover:text-blue-600 dark:group-hover:text-blue-500" fill="none"  stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
           <path stroke-linecap="round" stroke-linejoin="round" d="M7.864 4.243A7.5 7.5 0 0119.5 10.5c0 2.92-.556 5.709-1.568 8.268M5.742 6.364A7.465 7.465 0 004.5 10.5a7.464 7.464 0 01-1.15 3.993m1.989 3.559A11.209 11.209 0 008.25 10.5a3.75 3.75 0 117.5 0c0 .527-.021 1.049-.064 1.565M12 10.5a14.94 14.94 0 01-3.6 9.75m6.633-4.596a18.666 18.666 0 01-2.485 5.33"></path>
            </svg>
          Marks
        </button>
        <button @click="setActiveButton('page3'); navigateToPage3()" type="button" :class="{ 'bg-white text-blue-600': activeButton === 'page3', ' text-white': activeButton !== 'page3' }" class="inline-flex flex-col items-center justify-center px-5 hover:bg-gray-50 dark:hover:bg-gray-800 group">


<svg class="rounded-md bg-emerald-500 w-11 group-hover:text-blue-600 dark:group-hover:text-blue-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904L9 18.75l-.813-2.846a4.5 4.5 0 00-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 003.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 003.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 00-3.09 3.09zM18.259 8.715L18 9.75l-.259-1.035a3.375 3.375 0 00-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 002.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 002.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 00-2.456 2.456zM16.894 20.567L16.5 21.75l-.394-1.183a2.25 2.25 0 00-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 001.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 001.423 1.423l1.183.394-1.183.394a2.25 2.25 0 00-1.423 1.423z"></path>
</svg>
           Settings
        </button>
        <button @click="setActiveButton('page4'); navigateToPage4()" type="button" :class="{ 'bg-white text-blue-600': activeButton === 'page4', ' text-white': activeButton !== 'page4' }" class="inline-flex flex-col items-center justify-center px-5 border-gray-200 hover:bg-gray-50 dark:hover:bg-gray-800 group border-x dark:border-gray-600">
          <svg class="rounded-md bg-emerald-500 w-11 group-hover:text-blue-600 dark:group-hover:text-blue-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">  <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"></path>
</svg>
          Profile
        </button>

    </div>
</div>

</div>
<div class="w-1/4">
  <!-- content for the third div goes here -->

  <div class="flex flex-row">

    <button     id="searchButton"
 type="button" class ="flex mr-4 ml-3 text-sm  rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600">
      <svg  class="w-8 bold text-blue-900" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
          </button>
          <div
    id="searchBar"
    class="absolute top-0 mt-16 right-16 bg-white rounded-md shadow-md hidden"
  >
    <input
      type="text"
      placeholder="Search..."
      class="px-4 py-2 w-64 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
    />
  </div>
          <button id="se" type="button" class ="flex mr-4 ml-3 text-sm  rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600">
              <svg class="w-8 bold text-blue-900" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244"></path>
              </svg>
          </button>

          <!--
          <nuxtLink to="/mii/profiles/edit" id="se" type="button" class ="flex mr-4 ml-3 text-sm  rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600">
            <svg class="w-8 bold text-blue-900" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
            </svg>
          </nuxtLink>
                   -->
       <button @click="showList = !showList"
                   class ="flex mr-4 ml-3 text-sm  rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600">
               <svg  class="w-8 bold text-blue-900" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 12a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375M21 12c0 4.556-4.03 8.25-9 8.25a9.764 9.764 0 01-2.555-.337A5.972 5.972 0 015.41 20.97a5.969 5.969 0 01-.474-.065 4.48 4.48 0 00.978-2.025c.09-.457-.133-.901-.467-1.226C3.93 16.178 3 14.189 3 12c0-4.556 4.03-8.25 9-8.25s9 3.694 9 8.25z"></path>
        </svg>
  </button>
<div v-if="showList"  class="absolute top-0 mt-16 right-16 bg-white rounded-md shadow-md">
  <ul  class="flex flex-col bg-gray-300 p-2 w-64 border-gray-400 rounded">
      <span><strong>Messages</strong></span>


          <li>
            <div class="select-none cursor-pointer bg-gray-200 rounded-md flex flex-1 items-center p-4  transition duration-500 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
  <div class="flex flex-col rounded-full w-10 h-10 bg-gray-300 justify-center items-center mr-4">
  <img class="object-cover object-center h-32" src='#' alt='New image'>
    </div>
     <div class="flex-1 pl-1 mr-16">
        <div class="font-medium"> </div>

   </div>

</div>
          </li>
    </ul>
</div>


  <button @click="notificationList =!notificationList"
           class ="flex mr-4 ml-3 text-sm  rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600">
  <svg class="w-8 bold text-blue-900" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0M3.124 7.5A8.969 8.969 0 015.292 3m13.416 0a8.969 8.969 0 012.168 4.5"></path>
</svg>

  </button>
  <div v-if="notificationList"  class="absolute top-0 mt-16 right-4 bg-white rounded-md shadow-md">
  <ul  class="flex flex-col bg-gray-300 p-2 w-64 border-gray-400 rounded">
      <span><strong>Notification</strong></span>


              <li class="border-gray-400 flex flex-row mb-2">
        <div class="select-none cursor-pointer bg-gray-200 rounded-md flex flex-1 items-center p-4  transition duration-500 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
        <div class="flex flex-col rounded-md w-10 h-10 bg-gray-300 justify-center items-center mr-4">⚽️</div>
        <div class="flex-1 pl-1 mr-16">
          <div class="font-medium">Training</div>
          <div class="text-gray-600 text-sm">1h</div>
        </div>

        </div>
         </li>
         <li class="border-gray-400 flex flex-row mb-2">
        <div class="select-none cursor-pointer bg-gray-200 rounded-md flex flex-1 items-center p-4  transition duration-500 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
        <div class="flex flex-col rounded-md w-10 h-10 bg-gray-300 justify-center items-center mr-4">?</div>
        <div class="flex-1 pl-1 mr-16">
          <div class="font-medium">Study</div>
          <div class="text-gray-600 text-sm">4h</div>
        </div>

        </div>
         </li>

    </ul>
</div>



          <button id="dropdownButton" class="flex mr-3 ml-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" type="button">
                 <span class="sr-only">Open user menu</span>
                 <img class="w-8 h-8 rounded-full"  :src="user.image" alt="user photo">
          </button>


    <button type="button" data-collapse-toggle="navbar-search" aria-controls="navbar-search" aria-expanded="false" class="md:hidden text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5 mr-1" >
      <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
      <span class="sr-only">Search</span>
    </button>

    <button data-collapse-toggle="navbar-search" type="button" class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-search" aria-expanded="false">
      <span class="sr-only">Open menu</span>
      <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
    </button>

</div>
    <!-- Dropdown menu -->
    <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow dark:bg-gray-700 dark:divide-gray-600" id="dropdownMenu">
      <div class="px-4 py-3">
        <span class="block text-sm text-gray-900 dark:text-white">{{ user.name }}</span>

        <span class="block text-sm  text-gray-500 truncate dark:text-gray-400">{{ user.email }}</span>
      </div>
      <ul class="py-2" aria-labelledby="dropdownButton">
        <li>
          <nuxtLink to="/mii/profiles/myProfile" class="relative inline-flex items-center w-full px-4 py-2 text-sm font-medium border-b border-gray-200 rounded-t-lg hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white dark:focus:ring-gray-500 dark:focus:text-white">
        <svg aria-hidden="true" class="w-4 h-4 mr-2 fill-current" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"></path></svg>
        Profile
    </nuxtLink>        </li>
        <li>
          <nuxtLink to="/dashboard" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Dashboard</nuxtLink>         </li>
        <li>
          <nuxtLink to="/mii/profiles/edit" class="relative inline-flex items-center w-full px-4 py-2 text-sm font-medium border-b border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white dark:focus:ring-gray-500 dark:focus:text-white">
             <svg aria-hidden="true" class="w-4 h-4 mr-2 fill-current" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M5 4a1 1 0 00-2 0v7.268a2 2 0 000 3.464V16a1 1 0 102 0v-1.268a2 2 0 000-3.464V4zM11 4a1 1 0 10-2 0v1.268a2 2 0 000 3.464V16a1 1 0 102 0V8.732a2 2 0 000-3.464V4zM16 3a1 1 0 011 1v7.268a2 2 0 010 3.464V16a1 1 0 11-2 0v-1.268a2 2 0 010-3.464V4a1 1 0 011-1z"></path></svg>
               Settings
          </nuxtLink>
         </li>
         <li>
          <button type="button" class="relative inline-flex items-center w-full px-4 py-2 text-sm font-medium border-b border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white dark:focus:ring-gray-500 dark:focus:text-white">

            <svg aria-hidden="true" class="w-4 h-4 mr-2 fill-current" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 3a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2V5a2 2 0 00-2-2H5zm0 2h10v7h-2l-1 2H8l-1-2H5V5z" clip-rule="evenodd"></path></svg>
        Messages
    </button>
         </li>

        <li>
            <Log />
        </li>

      </ul>
    </div>




</div>
</div>

  </template>
  <script setup>
  import { onMounted } from 'vue'
  import { Dropdown } from 'flowbite'
  onMounted(() => {
     // set the dropdown menu element
     const $targetEl = document.getElementById('dropdownMenu');
const $triggerEl = document.getElementById('dropdownButton');
const options = {
  placement: 'bottom',
  offsetSkidding: 0,
  offsetDistance: 10,
  onHide: () => {
    console.log('dropdown has been hidden');
    // Save the state of the dropdown as closed in localStorage
    localStorage.setItem('dropdownState', 'closed');
  },
  onShow: () => {
    console.log('dropdown has been shown');
    // Save the state of the dropdown as open in localStorage
    localStorage.setItem('dropdownState', 'open');
  },
};

// Check if the dropdown was previously open or closed
const dropdownState = localStorage.getItem('dropdownState');

if (dropdownState === 'open') {
  // Create and show the dropdown if it was previously open
  const dropdown = new Dropdown($targetEl, $triggerEl, options);
  dropdown.show();
}
      }
  )

  </script>
<script>
export default {
  data() {
    return {
      showList: false,
      notificationList: false,
      activeButton: null,
      user:[]
    }
  },
  async fetch() {

const response = await this.$axios.get(`http://127.0.0.1:8000/api/user`);
this.user = response.data.user;

},
  mounted() {
    const searchButton = document.getElementById('searchButton');
    const searchBar = document.getElementById('searchBar');

    searchButton.addEventListener('click', () => {
      searchBar.classList.toggle('hidden');
    });
  },
  methods: {
    setActiveButton(button) {
      this.activeButton = button
    },
    navigateToPage1() {
      this.$router.push('/mii/posts') // replace '/page1' with the path you want to navigate to
    },
    navigateToPage2() {
      this.$router.push('/mii/interests') // replace '/page2' with the path you want to navigate to
    },
    navigateToPage3() {
      this.$router.push('') // replace '/page3' with the path you want to navigate to
    },
    navigateToPage4() {
      const userId = this.$auth.user.id
      if (userId) {
    this.$router.push('/mii/profiles/myProfile')
  } else {
    // Handle case where user is not authenticated
    // For example, redirect to login page
    this.$router.push('/login')
  }    },

  }
}
</script>
