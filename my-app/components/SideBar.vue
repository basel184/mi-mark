<template>
  <div class="fixed top-32" style="display: flex; flex-direction: row-reverse;margin-right: 11px;">
    <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 75px; " class="border rounded-md ml-2 " >
        <span class="border rounded-md ">
          <p class="font-mono font-medium">MII MENU </p>
        </span>
      <button
    @click="changeTab('notificationsTab')"
    :class="[currentSidebarTab === 'notificationsTab' ? 'text-white bg-indigo-600' : 'mt-2 mb-2 text-gray-500 bg-white', 'mt-2 mb-2 p-2 transition-colors rounded-lg shadow-md hover:bg-indigo-800 hover:text-white focus:outline-none focus:ring focus:ring-indigo-600 focus:ring-offset-white focus:ring-offset-2']"
  >
  <svg  aria-hidden="true" class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h7" />
                </svg>

  </button>
  <button
       @click="changeTab('profileTab')"
       :class="[currentSidebarTab === 'profileTab' ? 'text-white bg-indigo-600' : 'mt-2 mb-2 text-gray-500 bg-white', 'mt-2 mb-2 p-2 transition-colors rounded-lg shadow-md hover:bg-indigo-800 hover:text-white focus:outline-none focus:ring focus:ring-indigo-600 focus:ring-offset-white focus:ring-offset-2']">
            <svg aria-hidden="true" class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                </svg>

  </button>
  <button
    @click="changeTab('settingsTab')"
    :class="[currentSidebarTab === 'settingsTab' ? 'text-white bg-indigo-600' : 'mt-2 mb-2 text-gray-500 bg-white', 'mt-2 mb-2 p-2 transition-colors rounded-lg shadow-md hover:bg-indigo-800 hover:text-white focus:outline-none focus:ring focus:ring-indigo-600 focus:ring-offset-white focus:ring-offset-2']"
  >
      <svg
                  aria-hidden="true"
                  class="w-6 h-6"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"
                  />
                </svg>

  </button>
  <!--
  <button
    @click="changeTab('settingsTab')"
    :class="[currentSidebarTab === 'settingsTab' ? 'text-white bg-indigo-600' : 'mt-2 mb-2 text-gray-500 bg-white', 'mt-2 mb-2 p-2 transition-colors rounded-lg shadow-md hover:bg-indigo-800 hover:text-white focus:outline-none focus:ring focus:ring-indigo-600 focus:ring-offset-white focus:ring-offset-2']"
  >
  <svg class="w-6 h-6 font-bold"  fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z"></path>
</svg>

  </button>
   -->

</div>
<div  class=" rounded-lg">
  <div
  class="w-48 py-1 origin-bottom-right bg-white rounded-md shadow-lg focus:outline-none"    role="menu"
    aria-orientation="vertical"
    aria-label="user menu"
  >
      <div v-if="currentSidebarTab === 'notificationsTab'" class="relative right-12 bottom-0" style="width: 240px;" >
        <!-- Notifications Tab Content -->

        <ul class="flex flex-col bg-gray-100 p-2 border-gray-300 rounded h-48 overflow-y-auto scrollbar-visible scrollbar-track-gray-300" style="height:400px ;">
          <span> <strong>Important Links  </strong> </span>
            <li v-for="href in hrefs" :key="href" style="width: 215px;" class="border-gray-400 flex flex-row mb-2 h-12 w-60  rounded-3xl" >
             <div class="select-none cursor-pointer bg-gray-200 rounded-md flex flex-1 items-center p-4  transition duration-500 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
              <div class="flex flex-col rounded-md w-10 h-10 bg-gray-300 justify-center items-center mr-4">
              <img class="object-cover object-center h-32" :src='href.image' alt='New image'>
                </div>
                 <div class="flex-1 pl-1 ">

                  <span> <nuxt-link :to="href.link ? href.link : ''"> <p class="font-medium font-sans text-sm"> {{ href.name }}</p> </nuxt-link> </span>

               </div>

            </div>
        </li>
        <!--
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
              -->
    </ul>


      </div>
      <div v-if="currentSidebarTab === 'profileTab'" class="relative right-12 bottom-0">
        <!-- component -->

<!-- component -->
<!--Follow link for animation in action https://play.tailwindcss.com/IpRdROqEoQ -->
<ul class="flex flex-col bg-gray-300 p-2 w-64 border-gray-400 rounded ">
 <span> <strong>Messages </strong> </span>
<li v-for="href in hrefs" :key="href" class="border-gray-400 flex flex-row mb-2 h-12 w-60  rounded-3xl " >
 <div class="select-none cursor-pointer bg-gray-200 rounded-md flex flex-1 items-center p-4  transition duration-500 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
  <div class="flex flex-col rounded-full w-10 h-10 bg-gray-300 justify-center items-center mr-4">
  <img class="object-cover object-center h-32" src='#' alt='New image'>
    </div>
     <div class="flex-1 pl-1 mr-16">
        <div class="font-medium"> </div>

   </div>

</div>
</li>
<!--
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
          -->
        </ul>

      </div>
      <div v-if="currentSidebarTab === 'settingsTab'" class="relative right-12 bottom-0">
        <!-- Settings Tab Content -->
        <p>Settings Tab</p>
        <!-- component -->
          <div class="w-full max-w-screen-xl mx-auto p-6">
  <div class="relative rounded overflow-hidden border border-grey-light mb-8 bg-white">
    <div class="border-b border-grey-light p-4 bg-grey-lighter py-8">
      <div class="bg-white mx-auto max-w-sm shadow-lg rounded-lg overflow-hidden">
        <div class="sm:flex sm:items-center px-2 py-4">
          <div class="flex-grow">
            <h3 class="font-normal px-2 py-3 leading-tight">Contacts</h3>
            <input type="text" placeholder="Search teams or members"
              class="my-2 w-full text-sm bg-grey-light text-grey-darkest rounded h-10 p-3 focus:outline-none" />
            <div class="w-full">
              <div class="flex cursor-pointer my-1 hover:bg-blue-lightest rounded">
                <div class="w-8 h-10 text-center py-1">
                  <p class="text-3xl p-0 text-green-dark">&bull;</p>
                </div>
                <div class="w-4/5 h-10 py-3 px-1">
                  <p class="hover:text-blue-dark">Kevin Durant</p>
                </div>
                <div class="w-1/5 h-10 text-right p-3">
                  <p class="text-sm text-grey-dark">Member</p>
                </div>
              </div>
              <div class="flex cursor-pointer my-1 hover:bg-blue-lightest rounded">
                <div class="w-8 h-10 text-center py-1">
                  <p class="text-3xl p-0 text-grey-dark">&bull;</p>
                </div>
                <div class="w-4/5 h-10 py-3 px-1">
                  <p class="hover:text-blue-dark">James Harden</p>
                </div>
                <div class="w-1/5 h-10 text-right p-3">
                  <p class="text-sm text-grey-dark">Team</p>
                </div>
              </div>
              <div class="flex cursor-pointer my-1 hover:bg-blue-lightest rounded">
                <div class="w-8 h-10 text-center py-1">
                  <p class="text-3xl p-0 text-green-dark">&bull;</p>
                </div>
                <div class="w-4/5 h-10 py-3 px-1">
                  <p class="hover:text-blue-dark">Michael Jordan</p>
                </div>
                <div class="w-1/5 h-10 text-right p-3">
                  <p class="text-sm text-grey-dark">Member</p>
                </div>
              </div>
              <div class="flex cursor-pointer my-1 hover:bg-blue-lightest rounded">
                <div class="w-8 h-10 text-center py-1">
                  <p class="text-3xl p-0 text-grey-dark">&bull;</p>
                </div>
                <div class="w-4/5 h-10 py-3 px-1">
                  <p class="hover:text-blue-dark">Tim Duncan</p>
                </div>
                <div class="w-1/5 h-10 text-right p-3">
                  <p class="text-sm text-grey-dark">Team</p>
                </div>
              </div>
              <div class="flex my-1 cursor-pointer hover:bg-blue-lightest rounded">
                <div class="w-8 h-10 text-center py-1">
                  <p class="text-3xl p-0 text-grey-dark">&bull;</p>
                </div>
                <div class="w-4/5  h-10 py-3 px-1">
                  <p class="hover:text-blue-dark">Lebrr James</p>
                </div>
                <div class="w-1/5 h-10 text-right p-3">
                  <p class="text-sm text-grey-dark">Member</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="sm:flex bg-grey-light sm:items-center px-2 py-4">
          <div class="flex-grow text-right">
            <button class="text-grey-darkest hover:text-grey-dark py-2 px-4 rounded">
              Cancel
            </button>
            <button class="bg-blue hover:bg-blue-dark text-white py-2 px-4 rounded">
              Invite
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
          </div>
      </div>
    </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isSidebarOpen: false,
      currentSidebarTab: 'notificationsTab',
      hrefs:[]
    };
  },
  created() {
    this.fetchLinks();
  },
  methods: {
    async fetchLinks() {
      try {
        const response = await fetch('http://127.0.0.1:8000/api/links');
        const data = await response.json();
        this.hrefs = data.hrefs;
      } catch (error) {
        console.error(error);
      }
    },
    changeTab(tab) {
      if (this.isSidebarOpen && this.currentSidebarTab === tab) {
        this.isSidebarOpen = false;
      } else {
        this.isSidebarOpen = true;
        this.currentSidebarTab = tab;
      }
    }
  }
};
</script>
<style>
::-webkit-scrollbar {
  width: 4px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: rgb(219, 217, 217);
  border-radius: 4px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555;
}
</style>
