/*eslint-disable*/
import Vue from 'vue'
import App from './App.vue'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import router from './router'
import store from './store'
import Axios from 'axios'
import './plugins/axios';
import './plugins/async_computed';

Vue.config.productionTip = false


new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
