<template>
  <div v-if="showModel"  class="modall">
    <div class="modall-content max-w-l bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
      <div>
      <button @click="showModal = false"> <span class="close" >&times; X</span> </button>
      </div>
      <select v-model="selectedActivity" class="form-select">
        <option v-for="activity in activities" :key="activity.id" :value="activity.id">{{ activity.name }}</option>
      </select>

    </div>
    <div v-if="selectedActivity">
      <h2>Selected Activity:</h2>
      <p>{{ getActivityName(selectedActivity) }}</p>
    </div>

  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedActivity: null,
      activities: []
    };
  },
  created() {
    this.fetchActivities();
  },
  methods: {
    async fetchActivities() {
      try {
        const response = await fetch('http://127.0.0.1:8000/api/activities');
        const data = await response.json();
        this.activities = data.activities;
      } catch (error) {
        console.error(error);
      }
    },
    getActivityName(activityId) {
      const activity = this.activities.find(activity => activity.id === activityId);
      return activity ? activity.name : '';
    }
  }
};
</script>

<style scoped>
.modall {
  display: block;
  position: fixed;
  z-index: 99;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
}
.modall-content {
  background-color: #fefefe;
  margin: 5% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}
</style>
