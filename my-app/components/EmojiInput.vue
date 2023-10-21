<template>
  <div>
    <textarea v-model="input"></textarea>
<div style="width: 200px; height: 200px;">
    <emoji-picker @emoji="insert" :search="search">
      <div class="emoji-invoker" slot="emoji-invoker" slot-scope="{ events: { click: clickEvent } }" @click.stop="clickEvent">

        <button type="button" class="p-2 text-gray-500 rounded-lg cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
            <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM7 9a1 1 0 100-2 1 1 0 000 2zm7-1a1 1 0 11-2 0 1 1 0 012 0zm-.464 5.535a1 1 0 10-1.415-1.414 3 3 0 01-4.242 0 1 1 0 00-1.415 1.414 5 5 0 007.072 0z" clip-rule="evenodd"></path></svg>
            <span class="sr-only">Add emoji</span>
        </button>
        
      </div>
      <div slot="emoji-picker" slot-scope="{ emojis, insert, display }">
        <div>
          <div>
            <input type="text" v-model="search">
          </div>
          <div>
            <div v-for="(emojiGroup, category) in emojis" :key="category">
              <h5>{{ category }}</h5>
              <div>
                <button
                  v-for="(emoji, emojiName) in emojiGroup"
                  :key="emojiName"
                  @click="insert(emoji)"
                  :title="emojiName"
                >{{ emoji }}</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </emoji-picker>
  </div>
</div>
</template>

<script>
import EmojiPicker from 'vue-emoji-picker';

export default {
  components: {
    EmojiPicker
  },
  data() {
    return {
      input: '',
      search: ''
    };
  },
  methods: {
    insert(emoji) {
      this.input += emoji;
    }
  }
};
</script>
