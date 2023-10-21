require('dotenv').config()
  import Vue from 'vue';
import draggable from 'vuedraggable';

Vue.component('draggable', draggable);
export default {


  // Global page headers: https://go.nuxtjs.dev/config-head
  mode: 'spa',
  head: {
    title: 'my-app',
    htmlAttrs: {
      lang: 'ar'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    script: [
      {
        src: 'https://unpkg.com/emoji-picker-element@1.3.0/dist/emoji-picker-element.js'
      },
      {
        src: "https://cdn.jsdelivr.net/npm/alpinejs@3.12.3/dist/cdn.min.js",
        defer: true,
      },
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' } ,


    ]
  },

  env: {
    baseUrl: process.env.BASE_URL || 'http://127.0.0.1:8000/api/'
  },
  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '~/assets/css/input.css',

  ],
// Auto import components: https://go.nuxtjs.dev/config-components
components: true,
store: '~/store/user.js',
  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [

    {
     src: '~plugins/vform.js', defer: true
    },
    {
      src: '~plugins/flowbite.js', defer: true
     },
     {
      src: '~/plugins/emoji-picker.js', mode: 'client'
    },


  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/tailwindcss
    '@nuxtjs/tailwindcss',
    '@nuxt/postcss8'
  ],
  module: {

    rules: [
      {
        test: /\.js$/, // Match JavaScript files
        exclude: /node_modules/, // Exclude the node_modules directory
        use: {
          loader: 'babel-loader', // Use the Babel loader
          options: {
            // Babel options
          },
        },
      },
      // Add more rules for other file types if necessary
    ],
  },
  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    // 'bootstrap-vue/nuxt',
    '@nuxtjs/auth-next',
    '@nuxtjs/dotenv',
    '@nuxtjs/axios',
    '@nuxtjs/i18n',
    '@nuxtjs/style-resources',
    'nuxt-twemoji'
  ],
  styleResources: {
    scss: [
      '~/assets/css/emoji-mart-custom.scss'
    ]
  },
  // Axios module configuration: https://go.nuxtjs.dev/config-axios
 // Axios module configuration: https://go.nuxtjs.dev/config-axios
 axios: {
  // Workaround to avoid enforcing hard-coded localhost:3000: https://github.com/nuxt-community/axios-module/issues/308
  baseURL: process.env.BASE_URL || 'http://127.0.0.1:8000/api/',
  credentials: true,

},

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },
  i18n: {
    locales: [
      { code: 'ar', iso: 'ar-EG', file: require("./lang/ar.json"), dir: 'rtl' },
      { code: 'en', iso: 'en-US', file: require("./lang/en.json"), dir: 'ltr' },
    ],
    defaultLocale: "ar",
    vueI18n: {
      fallbackLocale: "ar",
      messages: {
        ar: require("./lang/ar.json"),
        en: require("./lang/en.json"),
      }
    },
  },

  auth: {
    strategies: {
      local: {
        token: {
          property: 'token',
          global: true
        },
   //    refreshToken: {
   //      property: 'token',
   //      data: 'token',
   //      maxAge: 60 * 60 * 24 * 7
   //    },
        user: {
          property: "user",

        },
        endpoints: {
          login: { url: '/login', method: 'post' },
          logout: { url: '/logout', method: 'post', },
          user: { url: '/user', method: 'get', propertyName: 'user' },
          refresh: { url: '/refresh', method: 'post', propertyName: 'token' },

        }
      },

    }
  },
}
