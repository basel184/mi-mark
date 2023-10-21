


<template>

  <div>
    <template>
    <div  style="height: 250px;" class="rounded-t-lg h-32 overflow-hidden">
      <div class="bg-cover bg-center h-56 p-4" style="background-image: url(https://via.placeholder.com/450x450)">
           <div class="flex justify-end">
             <svg class="w-6 h-6"  fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
               <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"></path>
             </svg>
           </div>
      </div>
     </div>
     <div class="grid grid-cols-1 md:grid-cols-3 border rounded-md">
          <div class="grid grid-cols-3 text-center order-last md:order-first mt-20 md:mt-0">



              <div class="border rounded-md ">
                   <p class="font-bold text-gray-700 text-xl">22</p>
                   <p class="text-gray-400">Friends</p>
             </div>
           <div class="border rounded-md ">
             <p class="font-bold text-gray-700 text-xl">10</p>
                 <p class="text-gray-400">Marks</p>
            </div>
                 <div class="border rounded-md ">
                   <p class="font-bold text-gray-700 text-xl">89</p>
                     <p class="text-gray-400">Comments</p>
                 </div>

              </div>
            <div class="relative">
                 <div class="w-40 h-40 bg-indigo-100 mx-auto rounded-full shadow-2xl absolute inset-x-0 top-0 -mt-24 flex items-center justify-center text-indigo-500">
                  <div class=" border-white rounded-full overflow-hidden"
    :class="{ 'full-image': imageIsFull }"
    @click="showFullImage">
  <img class="object-cover object-center w-40 h-40" :src="user.image" alt='New image'>

  <div class="absolute bottom-3 right-2">
    <svg class="w-6 h-6"  fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"></path>
</svg>
  </div>
</div>

                </div>
                    </div>
                     <div class="space-x-8 flex justify-between mt-32 md:mt-0 md:justify-center border rounded-md ">
                      <div class="border rounded-md w-3/6 flex justify-center w-14">

                     <img class="object-cover object-center w-14 w-14" :src="user.rule.image" alt='New image'>
                   </div>
                      <div class="border rounded-md w-3/6 flex justify-center">
                        <form @submit.prevent="toggleFollow">
      <input hidden type="text" v-model="follower_id" placeholder="معرف المستخدم" />

      <div>
        <button @click.prevent="toggleFollow" :disabled="isButtonDisabled" :class="{ 'bg-red-500': isFollowing, 'bg-blue-500' : !isFollowing }" class="text-white px-4 py-2 rounded shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5">
          {{ followButtonLabel }}
        </button>
      </div>

    </form>
                      </div>
                      <div class="border rounded-md w-3/6 flex justify-center">
                       <button  class="text-white py-2 px-4 uppercase rounded bg-gray-700 hover:bg-gray-800 shadow hover:shadow-lg font-medium transition transform hover:-translate-y-0.5">  Settings</button>
                      </div>

                       </div>
                       </div>

       <div class="text-center mt-2">
  <div class="flex h-32">


    <div class="w-1/4 p-9 border rounded-md h-80 ml-12 mt-16" >
      <h3 class="font-semibold">bio</h3>
      <p>{{  user.info[0].bio }}</p>
      <!-- Menu content -->
      <h3 class="font-semibold">Contact</h3>
      <ul class="menu bg-base-200 w-56 rounded-box">

  <li class="pt-2 ">
    <a class="flex items-center"> <!-- Add the "flex" and "items-center" classes -->
      <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z"></path>
  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z"></path>
</svg>
      <span>location : {{ user.info[0].countery }}</span> <!-- Wrap the text in a <span> element -->
    </a>
  </li>

  <li class="pt-2">
    <a class="flex items-center"> <!-- Add the "flex" and "items-center" classes -->
      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
      </svg>
      <span>City/Home: {{ user.info[0].city}}</span> <!-- Wrap the text in a <span> element -->
    </a>
  </li>
  <li class="pt-2">
    <a class="flex items-center"> <!-- Add the "flex" and "items-center" classes -->
      <svg  class="w-6 h-6"  fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5m-9-6h.008v.008H12v-.008zM12 15h.008v.008H12V15zm0 2.25h.008v.008H12v-.008zM9.75 15h.008v.008H9.75V15zm0 2.25h.008v.008H9.75v-.008zM7.5 15h.008v.008H7.5V15zm0 2.25h.008v.008H7.5v-.008zm6.75-4.5h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V15zm0 2.25h.008v.008h-.008v-.008zm2.25-4.5h.008v.008H16.5v-.008zm0 2.25h.008v.008H16.5V15z"></path>
</svg>
      <span>Birth Date : {{ user.info[0].date_of_birth }}</span> <!-- Wrap the text in a <span> element -->
    </a>
  </li>

  <li class="pt-2">
    <a class="flex items-center"> <!-- Add the "flex" and "items-center" classes -->
      <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 1.5H8.25A2.25 2.25 0 006 3.75v16.5a2.25 2.25 0 002.25 2.25h7.5A2.25 2.25 0 0018 20.25V3.75a2.25 2.25 0 00-2.25-2.25H13.5m-3 0V3h3V1.5m-3 0h3m-3 18.75h3"></path>
</svg>
      <span>Phone : {{ user.info[0].mobile }}</span> <!-- Wrap the text in a <span> element -->
    </a>
  </li>

  <!-- Rest of the list items -->
</ul>

      <!-- Place your menu content here -->
    </div>
    <div class="w-3/4 h-12">
      <!-- User data content -->
   <div class="mr-96 mt-9">
    <h2 class="font-semibold">{{ user.name }}</h2>
      <p class="text-gray-500">Freelance Web Designer</p>
      <div>
      <p v-if="isFollowing">تمت متابعة هذا المستخدم بالفعل</p>
    <p v-if="isFollower">هذا يتابعك</p>
    </div>
   </div>
    </div>
  </div>
</div>

<div class="flex">
  <div class="w-3/4 ml-auto">
    <div class="border rounded-md max-w-screen-md ml-16 ">

<!--
    <ul class=" py-4 mt-2 text-gray-700 flex items-center justify-around" id="tabExample" role="tablist" >
        <li class="flex flex-col items-center justify-around" role="presentation">
          <div>Stars</div>
            <button id="dashboard-tab-example" type="button" role="tab" aria-controls="dashboard-example" aria-selected="false" >
              <svg class="w-4 fill-current text-blue-900" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                <path
                    d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z" />
             </svg>
            </button>
            <div>2k</div>
        </li>
        <li class="flex flex-col items-center justify-between" role="presentation">
          Followers
           <button id="settings-tab-example" type="button" role="tab" aria-controls="settings-example" aria-selected="false">
            <svg class="w-4 fill-current text-blue-900" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                <path
                    d="M7 8a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm0 1c2.15 0 4.2.4 6.1 1.09L12 16h-1.25L10 20H4l-.75-4H2L.9 10.09A17.93 17.93 0 0 1 7 9zm8.31.17c1.32.18 2.59.48 3.8.92L18 16h-1.25L16 20h-3.96l.37-2h1.25l1.65-8.83zM13 0a4 4 0 1 1-1.33 7.76 5.96 5.96 0 0 0 0-7.52C12.1.1 12.53 0 13 0z" />
            </svg>
            </button>

            <div>10k</div>
        </li>
        <li class="flex flex-col items-center justify-around" role="presentation">
          <div>Answers</div>
           <button id="profile-tab-example" type="button" role="tab" aria-controls="profile-example" aria-selected="false">
            <svg class="w-4 fill-current text-blue-900" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                <path
                    d="M9 12H1v6a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-6h-8v2H9v-2zm0-1H0V5c0-1.1.9-2 2-2h4V2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v1h4a2 2 0 0 1 2 2v6h-9V9H9v2zm3-8V2H8v1h4z" />
            </svg>
          </button>
            <div>15</div>
        </li>
        <li class="flex flex-col items-center justify-around" role="presentation">
          <div>Settings</div>
           <button id="profile-taxb-example" type="button" role="tab" aria-controls="profile-example" aria-selected="false">
            <svg class="w-6 bold text-blue-900" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
               <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
            </svg>
          </button>
            <div>..</div>
        </li>
    </ul>
     -->
  </div>
  </div>
  <div>
    <!-- Content for the other div(s) -->
  </div>
</div>





    <div class="new">

        <div id="tabContentExample">
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="profile-example" role="tabpanel" aria-labelledby="profile-tab-example">
               <div>   </div>

            </div>
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="dashboard-example" role="tabpanel" aria-labelledby="dashboard-tab-example">

              <Settings />
            </div>
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="settings-example" role="tabpanel" aria-labelledby="settings-tab-example">
                <p class="text-sm text-gray-500 dark:text-gray-400">This is some placeholder content the <strong class="font-medium text-gray-800 dark:text-white">Settings tab's associated content</strong>. Clicking another tab will toggle the visibility of this one for the next. The tab JavaScript swaps classes to control the content visibility and styling.</p>
            </div>
            <div class="hidden p-4 rounded-lg bg-gray-50 dark:bg-gray-800" id="contacts-example" role="tabpanel" aria-labelledby="contacts-tab-example">
                <p class="text-sm text-gray-500 dark:text-gray-400">This is some placeholder content the <strong class="font-medium text-gray-800 dark:text-white">Contacts tab's associated content</strong>. Clicking another tab will toggle the visibility of this one for the next. The tab JavaScript swaps classes to control the content visibility and styling.</p>
            </div>
        </div>

    </div>
  </template>



</div>




</template>

<script>
export default {
  data() {
    return {
      user: {
        rule:[],
        info:[{

        }],
      },
      follower_id: "",
      imageIsFull: false,
      foll:[],

      isFollowing: false,
      isFollower: false,
      isButtonDisabled: false

    };
  },


  methods: {
    showFullImage() {
      this.imageIsFull = !this.imageIsFull
    },
    async toggleFollow() {
      if (this.isButtonDisabled) {
        // Ignore the click if the button is disabled
        return;
      }

      this.isButtonDisabled = true; // Disable the button to prevent multiple clicks

      try {
        if (this.isFollowing) {
          await this.unfollowUser();
        } else {
          await this.followUser();
        }


        // Perform any additional form submission logic here if needed

        // Reset the form input field after successful submission
        this.follower_id = '';
        this.$forceUpdate();
      } catch (error) {
        console.error(error);
      } finally {
        this.isButtonDisabled = false; // Re-enable the button after the operation is complete
      }
    },
    async checkFollowing() {
      try {
        // Simulating API call delay
        await new Promise(resolve => setTimeout(resolve, 1000));

        // Replace with your API endpoint
       const response = await this.$axios.post('http://127.0.0.1:8000/api/check-following', { follower_id: this.follower_id });



       this.isFollowing = response.data.isFollowing || false;
        this.isFollower = response.data.isFollower || false;

        // Simulating response
       // const data = { isFollowing: true };


        if (this.isFollowing) {
          alert('تمت متابعة هذا المستخدم بالفعل');
          if (response.data.isFollower) {
        this.isFollower = true;
      }
        } else {
          alert('يمكنك متابعة هذا المستخدم');
        }


      } catch (error) {
        console.error(error);
      }
    },
    async followUser() {
      const formData = new FormData();
      formData.append('follower_id', this.$route.params.userId);

      try {
        const response = await this.$axios.post('http://127.0.0.1:8000/api/follow', formData);
        const data = response.data;

        if (data.message === 'تمت المتابعة بنجاح') {
          alert(data.message);
          this.isFollowing = true;
          window.location.reload();
        } else {
          alert(data.message);
        }
      } catch (error) {
        console.error(error);
      }
    },
    async unfollowUser() {
      const formData = new FormData();
      formData.append('follower_id', this.$route.params.userId);

      try {
        const response = await this.$axios.post('http://127.0.0.1:8000/api/unfollow', formData);
        const data = response.data;

        if (data.message === 'تمت إلغاء المتابعة بنجاح') {

          alert(data.message);

          this.isFollowing = false;

        } else {
          alert(data.message);
        }
      } catch (error) {
        console.error(error);
      }
    }
  },
   watch: {
    follower_id() {
      this.isFollowing = false;
    }
  },
  computed: {
    isButtonDisabled() {
      return !this.follower_id || this.isFollowing;
    },
    userId() {
      return this.$route.params.userId;
    },
    followButtonLabel() {
      return this.isFollowing ? 'Unfollow' : 'Follow';
    }
  },

  mounted() {
    this.follower_id = this.$route.params.userId;
    this.checkFollowing();
    // قم بجلب قائمة المتابعين هنا
    // يمكنك استخدام مكتبة axios لإرسال الطلبات
  },

  async fetch() {
    const userId = this.$route.params.userId;
    const response = await this.$axios.get(`http://127.0.0.1:8000/api/users/${userId}`);
    this.user = response.data.user;

  },
};
 </script>

<script setup>
import { onMounted } from 'vue'
import { Tabs } from 'flowbite'
onMounted(() => {
   // create an array of objects with the id, trigger element (eg. button), and the content element
    const tabElements = [
        {
            id: 'profile',
            triggerEl: document.querySelector('#profile-tab-example'),
            targetEl: document.querySelector('#profile-example')
        },
        {
            id: 'dashboard',
            triggerEl: document.querySelector('#dashboard-tab-example'),
            targetEl: document.querySelector('#dashboard-example')
        },
        {
            id: 'settings',
            triggerEl: document.querySelector('#settings-tab-example'),
            targetEl: document.querySelector('#settings-example')
        },
      // {
      //     id: 'contacts',
      //     triggerEl: document.querySelector('#contacts-tab-example'),
      //     targetEl: document.querySelector('#contacts-example')
      // }
    ];
    // options with default values
    const options = {
        defaultTabId: 'profile',
        activeClasses: 'text-blue-600 hover:text-blue-600 dark:text-blue-500 dark:hover:text-blue-400 border-blue-600 dark:border-blue-500',
        inactiveClasses: 'text-gray-500 hover:text-gray-600 dark:text-gray-400 border-gray-100 hover:border-gray-300 dark:border-gray-700 dark:hover:text-gray-300',
        onShow: () => {
            console.log('tab is shown');
        }
    };
    if (document.querySelector('#profile-tab-example')) {
        /*
        * tabElements: array of tab objects
        * options: optional
        */
        const tabs = new Tabs(tabElements, options);
        // open tab item based on id
        tabs.show('profile');
    }
})
</script>
<style>
.image-container {
  width: 100%;
  max-width: 500px; /* set a max-width to limit the size of the image */
}

.full-image {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 9999;
  background-color: rgba(0, 0, 0, 0.8); /* add a semi-transparent black overlay */
  display: flex;
  justify-content: center;
  align-items: center;
}

.full-image img {
  max-width: 90%; /* set a max-width for the image */
  max-height: 90%; /* set a max-height for the image */
  object-fit: contain;
}
</style>
