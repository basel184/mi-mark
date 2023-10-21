<template>

  <div>
    <div class="max-w-l bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 h-20">
      <div class="">
        <div class="flex items-center justify-between mb-3 sm:flex h-20 " style="padding-top : 10px ;padding-bottom : 10px">

          <div class="flex items-center">
            <div class="my-div flex items-center w-14">
              <img :src="post.user['image']"  class=" rounded-full w-12 h-12 ml-2" alt="" >
            </div>
            <div>
              <a :href="getUserProfileLink(post.user.id , post.user.name)">

                  <button data-popover-target="popover-user-profile" type="button"
      @mouseover="showPopover"
      @mouseout="hidePopover" >
              <span class="font-semibold text-gray-900 dark:text-white hover:underline"> {{ post.user['name'] }}</span>
            </button>
          </a>
          <div
      ref="popover"
      data-popover
      id="popover-user-profile"
      role="tooltip"
      :class="{ 'invisible': !visible, 'opacity-0': !visible, 'opacity-100': visible }"
      class="absolute z-10 inline-block w-72 py-2 text-sm text-gray-500 transition-all duration-300 bg-white border border-gray-200 rounded-lg shadow-sm dark:text-gray-400 dark:bg-gray-800 dark:border-gray-600"
      @mouseenter="cancelHidePopover"
      @mouseleave="hidePopover"
    >
      <!-- Popover content -->


    <div class="p-3">
        <div class="flex items-center justify-between mb-2">
            <a href="#">
                <img class="w-10 h-10 rounded-full" :src="post.user.rule['image']" alt="Jese Leos">
            </a>
            <p c lass="text-base font-semibold leading-none text-gray-900 dark:text-white">
            <a href="#">{{post.user['name']}}</a>
        </p>

            <div>
                <button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-xs px-3 py-1.5 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Follow</button>
            </div>
        </div>
        <p class="text-base font-semibold leading-none text-gray-900 dark:text-white">
            <a href="#">{{post.user.rule['name']}}</a>
        </p>

        <p class="mb-3 text-sm font-normal">
            <a href="#" class="hover:underline">{{ post.user['email'] }}</a>
        </p>
        <ul class="flex text-sm">
            <li class="mr-2">
                <a href="#" class="hover:underline">
                    <span class="font-semibold text-gray-900 dark:text-white">799</span>
                    <span>Following</span>
                </a>
            </li>
            <li>
                <a href="#" class="hover:underline">
                    <span class="font-semibold text-gray-900 dark:text-white">3,758</span>
                    <span>Followers</span>
                </a>
            </li>
        </ul>
    </div>
    <div data-popper-arrow></div>

    </div>



              <span class="font-normal text-gray-500 dark:text-white hover:underline">Published this post </span>
              <br>
              <time class="ml-1 mb-1 text-xs font-normal text-gray-400 sm:order-last sm:mb-0">{{ timeAgo(post.created_at) }} </time>
              <span class="font-normal text-gray-500 dark:text-white hover:underline">
  <template v-if="post.status === 'public'">

    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z"></path>
</svg>
  </template>
  <template v-else-if="post.status === 'private'">
    <svg class="w-4 h-4"  fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"></path>
</svg>
  </template>
</span>

            </div>

             </div>
             <div>
              <div class="flex items-center justify-center">
            <span class="text-xs font-normal text-gray-400 dark:text-white hover:underline" >
                 {{ post.activity['name'] }}

                 </span>
                </div>

                  <div class="flex items-end justify-center">
              <img :src="post.activity['image']"  class="rounded-full w-14 h-14" alt="" >
            </div>
          </div>
        </div>

      </div>
    </div>


    <div class="p-5 ">
      <template  v-if="post.image" >

  <div class="" v-if="displayImage">
    <a href="#">
      <div v-if="isImageDisplayed" class="fixed-image-window">
        <div class="window-content1x">
          <button class="close" type="button" @click.prevent="closeImage">

          <div  class="" style="height:730px;position: relative;top: 70px; left: 0px; ">

          <img :src="post.image" alt="" class="h-5/6 ">
         </div>
        </button>

        </div>
      </div>
      <div v-else style=" display: flex; justify-content: center; align-items: center;">
        <button @click.prevent="isImageDisplayed = true" >
          <img :src="post.image" alt="" style=" height: 100%; width: 100%;">
</button>
      </div>
    </a>
  </div>
</template>

<template>
  <div v-if="post.video" style="width: 485px; height: 275px; display: flex; justify-content: center; align-items: center;">
  <video controls style="max-width: 105%; max-height: 105%;">
    <source :src="post.video" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</div>
</template>


     <div style="margin-top: 20px;">
      <a href="#">
        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{{ post.title }}</h5>
      </a>


          <div class="flex flex-col">
    <div class="mb-3 font-normal text-gray-700 dark:text-gray-400">

      <div class="">
        <p :class="{ 'max-lines-4': !isExpanded }" ref="paragraph">{{ paragraph }}</p>

      </div>


<div >
  <div v-if ="isExpanded">

    <div v-if ="paragraph.length > 140" >

       <button  @click="cancelExpansion" class="text-blue-500">
      See Less
      </button>

    </div>
    <div v-else>

</div>
  </div>

  <div v-else>

      <button  @click="showExpansion" class="text-blue-500">
      See more
      </button>

    </div>
    </div>
    </div>
  </div>



     </div>
      <div class="flex items-center pl-16 h-8 border-2 py-2 rounded-lg bg-gray-50 dark:bg-gray-700" role="group">
        <Reacts/>
  <button type="button" class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-900 bg-transparent border-t border-b border-white hover:bg-emerald-300 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-emerald-300 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-emerald-300">
    <svg class="w-3 h-3 mr-2" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 12a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375M21 12c0 4.556-4.03 8.25-9 8.25a9.764 9.764 0 01-2.555-.337A5.972 5.972 0 015.41 20.97a5.969 5.969 0 01-.474-.065 4.48 4.48 0 00.978-2.025c.09-.457-.133-.901-.467-1.226C3.93 16.178 3 14.189 3 12c0-4.556 4.03-8.25 9-8.25s9 3.694 9 8.25z"></path>
</svg>
    Comment
  </button>
  <button type="button" class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-900 bg-transparent border-t border-b border-white hover:bg-emerald-300 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-gray-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700">
    <svg class="w-3 h-3 mr-2" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z"></path>
</svg>
    Share
  </button>
  <button type="button" class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-900 bg-transparent border border-white rounded-r-md hover:bg-violet-900 hover:text-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-violet-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-violet-900">
    <svg class="w-3 h-3 mr-2"  fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path stroke-linecap="round" stroke-linejoin="round" d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0111.186 0z"></path>
</svg>
    Save
  </button>
</div>
    </div>



    <ol class="relative border-l border-gray-200 dark:border-gray-700">
      <li v-for="comment in comments" :key="comment.id" class="ml-6 ">
        <span style="
    margin-left: 28px;
" class="absolute flex items-center justify-center w-8 h-8 bg-blue-100 rounded-full -left-3 ring-8 ring-white dark:ring-gray-900 dark:bg-blue-900">
          <img class="rounded-full shadow-lg w-8 h-8" :src="comment.user['image']" alt="Thomas Lean image"/>
        </span>
        <div class= "bg-slate-200  shadow-sm dark:bg-gray-700 dark:border-gray-600" style="margin-bottom: 25px;height: 38px;width: 90%;margin-left: 29px;">
          <div class="items-center justify-between mb-3 sm:flex" style="padding-top:0px; margin-bottom: 10px; margin-top: -8px;">
            <div  style=" padding-left: 7px;" class="text-sm font-normal text-gray-500 lex dark:text-gray-300">{{comment.user['name'] }} <a href="#" class="font-semibold text-gray-900 dark:text-white hover:underline">Commented From</a> <time class="mb-1 text-xs font-normal text-gray-400 sm:order-last sm:mb-0">{{ timeAgo(comment.created_at) }}</time></div>
          </div>
          <div style="padding-top: 0px;padding-bottom: 5px;padding-left: 9px;position: relative;bottom: 5px;" class=" bg-slate-200 text-xs italic font-normal text-gray-900  rounded-lg  dark:bg-gray-600 dark:border-gray-500 dark:text-gray-300">
            {{ comment.body }}
          </div>
        </div>
      </li>
    </ol>

    <CommentForm :postId="post.id" />
  </div>
</template>



<script>
import CommentList from './CommentList.vue'
import CommentForm from './CommentForm.vue'
import { formatDistanceToNowStrict } from 'date-fns';
import EmojiPicker from 'vue-emoji-picker'

export default {
  data() {
    return {
      paragraph: this.post.body,
      isExpanded: false,
      hideTimeout: null,
      visible: false,
      comments: [],
      isImageDisplayed:false,
    }
  },
  props: {
    post: {
      type: Object,
      required: true
    }
  },
  created() {
    this.fetchComment(this.post.id)
  },
  mounted() {
    this.checkTruncation();
  },
  methods: {

    checkTruncation() {
      const paragraph = this.$refs.paragraph;
      if (paragraph.offsetHeight > 2 * parseFloat(getComputedStyle(paragraph).lineHeight)) {
        this.isExpanded = false;
      } else {
        this.isExpanded = true;
      }
    },
    toggleExpansion() {
      this.isExpanded = !this.isExpanded;
    },
    cancelExpansion() {
      this.isExpanded = false;
    },
    showExpansion(){
      this.isExpanded = true;
    },
    showPopover() {
      clearTimeout(this.hideTimeout);
      this.visible = true;
    },
    hidePopover() {
      this.scheduleHidePopover();
    },
    cancelHidePopover() {
      clearTimeout(this.hideTimeout);
    },
    scheduleHidePopover() {
      clearTimeout(this.hideTimeout);
      this.hideTimeout = setTimeout(() => {
        this.visible = false;
      }, 200);
    },

    displayImage() {
      this.isImageDisplayed = true;
    },
    closeImage() {
      this.isImageDisplayed = false;
    },
    stopPropagation(event) {
      event.stopPropagation();
    },
    getUserProfileLink(userId, userName) {
      const encodedName = encodeURIComponent(userName);
      return `/mii/profiles/${userId}`;
    },


    async fetchComment(postId) {
      const response = await this.$axios.get(`http://127.0.0.1:8000/api/posts/${postId}/comments`)
      // Handle the response
      this.comments = response.data.comments
    },
    timeAgo(dateTime) {
      return formatDistanceToNowStrict(new Date(dateTime), { addSuffix: true });
    },
    addEmoji(emoji) {
      this.post.body += emoji
    },
  },

  components: {
    CommentForm,
    CommentList,
    EmojiPicker
  },

}


</script>

<style>
.max-lines-4 {
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  display: -webkit-box;
  overflow: hidden;
}

.w-200 {
  width: 200px;
}
.opacity-0 {
  opacity: 0;
}

.opacity-100 {
  opacity: 1;
}
.fixed-image-window {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(49, 209, 148, 0.8); /* Green background for the window */
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
}

.window-content {
  position: relative;
  width: 900px;
  height: 900px;
}

.window-close {
  position: absolute;
  top: 10px;
  right: 10px;
}
.my-div {
  background-image: url('~~/mii/img/logo11.png/');
  background-size: cover; /* or contain, depending on your preference */
  background-position: center center; /* adjust as needed */
  height: 72px;
    width: 62px;}

    .fixed-image {
  /* Define your desired styles for the fixed-scale image */
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: 100%;
  max-height: 100%;
  z-index: 9999;
}

</style>
