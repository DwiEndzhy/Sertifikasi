<template>
  <div class="container mt-2">
    <section class="menu">
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">STMIK AKAKOM SERTIFIKASI</a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarScroll"
          aria-controls="navbarScroll"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
          <ul
            class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
            style="max-height: 100px;"
          >
            <li class="nav-item active">
              <a class="nav-link" href="/admin/read">
                Sertifikasi
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">
                Peserta
                <span class="sr-only">(current)</span>
              </a>
            </li>
          </ul>
          <form class="d-flex">
            <a href="/" class="btn btn-danger" type="submit" style="margin:3px;"
              >Logout</a
            >
          </form>
        </div>
      </nav>
    </section>
    <section class="content mt-2">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <span>Update Data Sertifikasi</span>
        </div>
        <div class="card-body">
          <form v-on:submit.prevent="onEdit">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="nama_sertifikasi">Nama Sertifikasi</label>
                  <input
                    type="text"
                    class="form-control"
                    id="nama_sertifikasi"
                    name="nama_sertifikasi"
                    v-model="nama_sertifikasi"
                    placeholder="masukkan nama sertifikasi"
                  />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="dosen_pengampu">Dosen Pengampu</label>
                  <input
                    type="text"
                    class="form-control"
                    id="dosen_pengampu"
                    name="dosen_pengampu"
                    v-model="dosen_pengampu"
                    placeholder="masukkan nama dosen pengampu"
                  />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="hari">Hari</label>
                  <select
                    class="form-control"
                    v-model="hari"
                    :items="day"
                    name="hari"
                    id="hari"
                  >
                    <option selected disabled>{{ hari }}</option>
                    <option
                      v-for="(text, i) in day"
                      :key="i"
                      :value="text.value"
                      >{{ text.text }}</option
                    >
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="jam">Jam</label>
                  <input
                    type="time"
                    class="form-control"
                    id="jam"
                    name="jam"
                    v-model="jam"
                    placeholder="masukkan jam"
                  />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="tanggal">Tanggal</label>
                  <input
                    type="date"
                    class="form-control"
                    id="tanggal"
                    name="tanggal"
                    v-model="tanggal"
                    placeholder="masukkan tanggal"
                  />
                </div>
              </div>
            </div>
            <input type="submit" class="btn btn-primary" value="Update" />
          </form>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      form: {
        nama_sertifikasi: "",
        dosen_pengampu: "",
        hari: this.$route.params.hari,
        jam: this.$route.params.jam,
        tanggal: "",
      },
      id_sertifikasi: this.$route.params.id_sertifikasi,
      nama_sertifikasi: this.$route.params.nama_sertifikasi,
      dosen_pengampu: this.$route.params.dosen_pengampu,
      hari: this.$route.params.hari,
      jam: this.$route.params.jam,
      tanggal: this.$route.params.tanggal,
      day: [
        { value: "senin", text: "senin" },
        { value: "selasa", text: "selasa" },
        { value: "rabu", text: "rabu" },
        { value: "kamis", text: "kamis" },
        { value: "jumat", text: "jum'at" },
        { value: "sabtu", text: "sabtu" },
        { value: "minggu", text: "minggu" },
      ],
    };
  },
  methods: {
    onEdit() {
      console.log(this.id_sertifikasi);
      let data = JSON.stringify({
        id_sertifikasi: this.id_sertifikasi,
        nama_sertifikasi: this.nama_sertifikasi,
        dosen_pengampu: this.dosen_pengampu,
        hari: this.hari,
        jam: this.jam,
        tanggal: this.tanggal,
      });
      axios
        .post(
          process.env.VUE_APP_BACKEND +
            "/sertifikasi_api/sertifikasi/update.php",
          data
        )
        .then(async (res) => {
          const data = await res;
          if (data.status == 200) {
            alert("Data Berhasil Update");
            this.$router.push("read");
          }
        })
        .catch((err) => {
          alert("Data Gagal Dikirim");
          console.log(err);
        });
    },
  },
};
</script>

<style lang="stylus" scoped></style>
