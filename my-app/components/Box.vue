<template>
  <div class="card-row pl-4">
    <Cards
      v-for="card in cards"
      :key="card.id"
      :card="card"
      @selected="handleCardSelection"
    />
  </div>
</template>

<script>
import Cards from '~/components/Cards.vue';

export default {
  middleware:'auth',
  components: {
    Cards,
  },

  props: {
    cards: Array,
    selectedCards: Array,
  },

  methods: {
    handleCardSelection(card) {
      card.selected = !card.selected;
      if (card.selected) {
        this.selectedCards.push(card);
      } else {
        const index = this.selectedCards.findIndex(c => c.id === card.id);
        if (index !== -1) {
          this.selectedCards.splice(index, 1);
        }
      }
    },


  },
};
</script>

<style scoped>
.card-row {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
}
</style>
