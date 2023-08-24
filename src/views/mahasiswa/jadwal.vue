<template>
  <div class="container mt-2">
    <Header />
    <section class="content">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <span class="btn btn-primary">Jadwal Sertifikasi</span>
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
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(jadwal, index) in jadwals"
                :key="jadwal.id_sertifikasi"
              >
                <td>{{ index + 1 }}</td>
                <td>{{ jadwal.nama_sertifikasi }}</td>
                <td>{{ jadwal.dosen_pengampu }}</td>
                <td>{{ jadwal.hari }}</td>
                <td>{{ jadwal.jam }}</td>
                <td>{{ jadwal.tanggal }}</td>
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
import Header from "@/components/_layout/HeaderNoLogin.vue";

export default {
  name: "HelloWorld",
  components: { Header },
  props: {
    msg: String,
  },
  data() {
    return {
      jadwals: [],
    };
  },
  methods: {
    getJadwal() {
      axios
        .get(
          process.env.VUE_APP_BACKEND + "/sertifikasi_api/sertifikasi/read.php"
        )
        .then((res) => {
          this.jadwals = res.data.body;
        })
        .catch((err) => {
          // handle error
          alert(err);
        });
    },
  },
  mounted() {
    this.getJadwal();
  },
};
</script>

<style lang=""></style>
