<template>
  <div class="flex">
  <div class="w-1/4 bg-gray-100 py-8">
    <div class="max-w-xs mx-auto">
      <div class="flex flex-col fixed top-120 left-10 z-10">
  <a @click.prevent="scrollToSection('#section1')" href="#section1" class="text-gray-600 hover:text-gray-800 px-4 py-2 inline-flex items-center">
      <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"></path>
      </svg>
      <span class="ml-2">Personal Info</span>
  </a>

  <a @click.prevent="scrollToSection('#section2')" href="#section2" class="block text-gray-600 hover:text-gray-800 px-4 py-2 inline-flex items-center">
      <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"></path>
      </svg>
      <span class="ml-2">Security</span>
  </a>

  <a @click.prevent="scrollToSection('#section3')" href="#section3" class="block text-gray-600 hover:text-gray-800 px-4 py-2 inline-flex items-center">
      <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round" d="M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.42 15.17l2.496-3.03c.317-.384.74-.626 1.208-.766M11.42 15.17l-4.655 5.653a2.548 2.548 0 11-3.586-3.586l6.837-5.63m5.108-.233c.55-.164 1.163-.188 1.743-.14a4.5 4.5 0 004.486-6.336l-3.276 3.277a3.004 3.004 0 01-2.25-2.25l3.276-3.276a4.5 4.5 0 00-6.336 4.486c.091 1.076-.071 2.264-.904 2.95l-.102.085m-1.745 1.437L5.909 7.5H4.5L2.25 3.75l1.5-1.5L7.5 4.5v1.409l4.26 4.26m-1.745 1.437l1.745-1.437m6.615 8.206L15.75 15.75M4.867 19.125h.008v.008h-.008v-.008z"></path>
      </svg>
      <span class="ml-2">Customize Account </span></a>
  </div>
    </div>
  </div>
  <div class="w-3/4">
    <main>
      <section id="section1" class=" bg-gray-100">

        <User />
      </section>
      <section id="section2" class="h-screen bg-gray-200">
        <h1 class="text-4xl font-bold text-gray-800 text-center pt-24">Section 2</h1>
      </section>
      <section id="section3" class="h-screen bg-gray-300">
        <h1 class="text-4xl font-bold text-gray-800 text-center pt-24">Section 3</h1>
      </section>
    </main>
  </div>
</div>


</template>

<script>
import User from '~/components/User.vue'

export default {
components: {
  User
},
methods: {
  scrollToSection(id) {
    const el = document.querySelector(id)
    window.scrollTo({
      behavior: 'smooth',
      top: el.offsetTop,
    })
    window.history.pushState(null, null, id)
  }
}
}
</script>
