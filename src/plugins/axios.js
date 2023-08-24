import Vue from "vue";
import axios from "axios";
import store from "../store";
/* eslint-disable */
axios.defaults.headers.common[
  "Authorization"
] = `Bearer ${store.getters.token}`;

const api = axios.create({
  baseURL: "https://sertifikasife.xyz",
});

const plugin = {
  install(V) {
    // eslint-disable-next-line
    V.prototype.$api = api;
  },
};

Vue.use(plugin);

export default plugin;
