<template>
  <div class="container mt-2">
    <Header />
    <section class="content mt-2">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <a href="/admin/insert" class="btn btn-primary mb-2"
            >+ Tambah Sertifikasi</a
          >
          <button @click="printSertifikasi" class="btn btn-success mb-2">
            Print
          </button>
        </div>
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Sertifikasi</th>
                <th>Dosen Pengampu</th>
                <th>Hari</th>
                <th>Jam</th>
                <th>Tanggal</th>
                <th>Action</th>
              </tr>
              <tr>
                <th></th>
                <th>
                  <input
                    class="input-search"
                    type="text"
                    placeholder="search by Nama Sertifikasi"
                    v-model="searchNama"
                    @keyup="fetchNama"
                  />
                </th>
                <th>
                  <input
                    class="input-search"
                    type="text"
                    placeholder="search by Dosen Pengampu"
                    v-model="searchDosen"
                    @keyup="fetchDosen"
                  />
                </th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(sertifikasi, index) in sertifikasis"
                :key="sertifikasi.id_sertifikasi"
              >
                <td>{{ index + 1 }}</td>
                <td>{{ sertifikasi.nama_sertifikasi }}</td>
                <td>{{ sertifikasi.dosen_pengampu }}</td>
                <td>{{ sertifikasi.hari }}</td>
                <td>{{ sertifikasi.jam }}</td>
                <td>{{ sertifikasi.tanggal }}</td>
                <td>
                  <router-link
                    :to="{
                      name: 'Update',
                      params: {
                        id_sertifikasi: sertifikasi.id_sertifikasi,
                        nama_sertifikasi: sertifikasi.nama_sertifikasi,
                        dosen_pengampu: sertifikasi.dosen_pengampu,
                        hari: sertifikasi.hari,
                        jam: sertifikasi.jam,
                        tanggal: sertifikasi.tanggal,
                      },
                    }"
                    class="btn btn-success"
                    >Edit</router-link
                  >
                  |
                  <button
                    @click="deleteItem(sertifikasi.id_sertifikasi)"
                    class="btn btn-danger"
                  >
                    Delete
                  </button>
                </td>
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
import Header from "@/components/_layout/Header.vue";
import Helpers from "@/plugins/helpers.js";

export default {
  components: { Header },
  props: {
    msg: String,
  },
  data() {
    return {
      sertifikasis: [],
      searchNama: "",
      searchDosen: "",
    };
  },
  methods: {
    fetchNama() {
      this.$store.dispatch("FETCH_SERTIFIKAT", this.searchNama).then((res) => {
        this.sertifikasis = res.data.body;
      });
    },
    fetchDosen() {
      this.$store.dispatch("FETCH_NAMA_DOSEN", this.searchDosen).then((res) => {
        this.sertifikasis = res.data.body;
      });
    },
    getSertifikasi() {
      axios
        .get(
          process.env.VUE_APP_BACKEND + "/sertifikasi_api/sertifikasi/read.php"
        )
        .then((res) => {
          this.sertifikasis = res.data.body;
        })
        .catch((err) => {
          // handle error
          alert(err);
        });
    },
    deleteItem(id_sertifikasi) {
      let conf = confirm("Anda ingin menghapus data ini?");
      if (conf) {
        axios
          .delete(
            process.env.VUE_APP_BACKEND +
              "/sertifikasi_api/sertifikasi/delete.php?id_sertifikasi=" +
              id_sertifikasi
          )
          .then((res) => {
            if (res.status == 200) {
              alert("Data Berhasil Hapus");
              this.getSertifikasi();
            }
          })
          .catch((err) => {
            alert(err);
          });
      } else return false;
    },
    printSertifikasi() {
      Helpers.printSertifikasi(this.sertifikasis);
    },
  },
  mounted() {
    this.getSertifikasi();
  },
};
</script>

<style scoped>
.input-search {
  line-height: 2;
}
</style>
