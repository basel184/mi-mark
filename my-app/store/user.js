import axios from 'axios'

const state = () => ({
  user: null,
  loggedIn: false
})

const getters = {
  getUser: state => state.user,
  isLoggedIn: state => state.loggedIn
}

const mutations = {
  setUser(state, user) {
    state.user = user
    state.loggedIn = true
  },
  clearUser(state) {
    state.user = null
    state.loggedIn = false
  }
}

const actions = {
  async login({ commit }, { email, password }) {
    try {
      const response = await axios.post('/api/login', { email, password })
      const user = response.data.user
      commit('setUser', user)
      return user
    } catch (error) {
      commit('clearUser')
      throw error
    }
  },
  async logout({ commit }) {
    try {
      await axios.post('/api/logout')
      commit('clearUser')
    } catch (error) {
      throw error
    }
  },
  async checkAuth({ commit }) {
    try {
      const response = await axios.get('/api/user')
      const user = response.data.user
      commit('setUser', user)
      return user
    } catch (error) {
      commit('clearUser')
      throw error
    }
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
