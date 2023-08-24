import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);
export default new Vuex.Store({
  state: {
    token: "",
    filter: "",
  },
  mutations: {
    token(state, payload) {
      if (payload === null) {
        // eslint-disable-next-line
        state.token = "";
        localStorage.removeItem("tugas:token");
      } else {
        // eslint-disable-next-line
        state.token = payload;
        localStorage.setItem("tugas:token", payload);
      }
    },
    SET_FILTER(state, data) {
      state.filter = data;
    },
  },
  getters: {
    token(state) {
      return state.token || localStorage.getItem("tugas:token");
    },
  },
  actions: {
    FETCH_NIM({ commit }, nim) {
      return new Promise(function(resolve, reject) {
        axios
          .get(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/mahasiswa/readnim.php?nim=" +
              nim
          )
          .then((res) => {
            if (!res.error) {
              resolve(res);
              commit("SET_FILTER", res);
            }
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    FETCH_JURUSAN({ commit }, jurusan) {
      return new Promise(function(resolve, reject) {
        axios
          .get(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/mahasiswa/readjurusan.php?jurusan=" +
              jurusan
          )
          .then((res) => {
            if (!res.error) {
              resolve(res);
              commit("SET_FILTER", res);
            }
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    FETCH_NAMA({ commit }, nama) {
      return new Promise(function(resolve, reject) {
        axios
          .get(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/mahasiswa/readnama.php?nama=" +
              nama
          )
          .then((res) => {
            if (!res.error) {
              resolve(res);
              commit("SET_FILTER", res);
            }
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    FETCH_SERTIFIKAT({ commit }, nama) {
      return new Promise(function(resolve, reject) {
        axios
          .get(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/sertifikasi/ReadNamaSertifikasi.php?nama_sertifikasi=" +
              nama
          )
          .then((res) => {
            if (!res.error) {
              resolve(res);
              commit("SET_FILTER", res);
            }
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    FETCH_NAMA_DOSEN({ commit }, dosen) {
      return new Promise(function(resolve, reject) {
        axios
          .get(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/sertifikasi/readnamadosen.php?dosen_pengampu=" +
              dosen
          )
          .then((res) => {
            if (!res.error) {
              resolve(res);
              commit("SET_FILTER", res);
            }
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    /* eslint-disable */
    onSubmitMhs({ commit }, formData) {
      return new Promise(function(resolve, reject) {
        axios
          .post(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/mahasiswa/mahasiswa.php",
            formData,
            {
              headers: {
                "Content-Type": "multipart/form-data",
              },
            }
          )
          .then((res) => {
            if (!res.error) {
              resolve(res);
            }
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
  },
});
