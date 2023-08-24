<template>
  <div class="container mt-2">
    <Header />
    <section class="content mt-2">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <!-- <span
            @click="$router.push('/admin/insert')"
            class="btn btn-lg btn-primary"
            >Daftar Peserta Yang Mendaftar Sertifikasi</span
          > -->

          <h5><b>Daftar Peserta Yang Mendaftar Sertifikasi</b></h5>
          <button @click="printPdf" class="btn btn-lg btn-success">
            Print
          </button>
        </div>
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>No</th>
                <th>Nim</th>
                <th>Nama Mahasiswa</th>
                <th>Jurusan</th>
                <th>Pilihan 1</th>
                <th>Pilihan2</th>
                <th>Pilihan3</th>
              </tr>
              <tr>
                <th></th>
                <th>
                  <input
                    class="input-search"
                    type="text"
                    placeholder="search by NIM"
                    v-model="searchNim"
                    @keyup="fetchNim"
                  />
                </th>
                <th>
                  <input
                    class="input-search"
                    type="text"
                    placeholder="search by Nama Mhs"
                    v-model="searchNama"
                    @keyup="fetchNama"
                  />
                </th>
                <th>
                  <input
                    class="input-search"
                    type="text"
                    placeholder="search by Jurusan"
                    v-model="searchJurusan"
                    @keyup="fetchJurusan"
                  />
                </th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(peserta, index) in pesertas" :key="peserta.id_mhs">
                <td>{{ index + 1 }}</td>
                <td>{{ peserta.nim }}</td>
                <td>{{ peserta.nama }}</td>
                <td>{{ peserta.jurusan }}</td>
                <td>{{ peserta.pilihan1 }}</td>
                <td>{{ peserta.pilihan2 }}</td>
                <td>{{ peserta.pilihan3 }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import Helpers from "@/plugins/helpers.js";
import Header from "@/components/_layout/Header.vue";

export default {
  name: "HelloWorld",
  components: {
    Header,
  },
  props: {
    msg: String,
  },
  data() {
    return {
      pesertas: [],
      searchNim: "",
      searchNama: "",
      searchJurusan: "",
    };
  },
  methods: {
    getPeserta() {
      axios
        .get(
          process.env.VUE_APP_BACKEND + "/sertifikasi_api/mahasiswa/peserta.php"
        )
        .then((res) => {
          this.pesertas = res.data.body;
        })
        .catch((err) => {
          // handle error
          console.log(err);
        });
    },
    fetchNim() {
      this.$store.dispatch("FETCH_NIM", this.searchNim).then((res) => {
        this.pesertas = res.data.body;
      });
    },
    fetchNama() {
      this.$store.dispatch("FETCH_NAMA", this.searchNama).then((res) => {
        this.pesertas = res.data.body;
      });
    },
    fetchJurusan() {
      this.$store.dispatch("FETCH_JURUSAN", this.searchJurusan).then((res) => {
        this.pesertas = res.data.body;
      });
    },
    printPdf() {
      /* eslint-disable */
      Helpers.printPdf(this.pesertas);
    },
  },
  mounted() {
    this.getPeserta();
  },
};
</script>

<style>
.input-search {
  line-height: 2.5;
}
</style>
