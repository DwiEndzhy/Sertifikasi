<template>
  <div class="container mt-2">
    <Header />
    <section class="content mt-2">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <span>Tambah Data Sertifikasi</span>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="nama_sertifikasi">Nama Sertifikasi</label>
                <input
                  type="text"
                  class="form-control"
                  id="nama_sertifikasi"
                  name="nama_sertifikasi"
                  v-model="form.nama_sertifikasi"
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
                  v-model="form.dosen_pengampu"
                  placeholder="masukkan nama dosen pengampu"
                />
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="hari">Hari</label>
                <select
                  class="form-control"
                  v-model="form.hari"
                  name="hari"
                  id="hari"
                >
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
                  v-model="form.jam"
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
                  v-model="form.tanggal"
                  placeholder="masukkan tanggal"
                />
              </div>
            </div>
          </div>
          <button @click="onSubmit" class="btn btn-primary" value="">
            Tambah
          </button>
        </div>
      </div>
    </section>
  </div>
</template>


<script>
import axios from "axios";
import Header from "@/components/_layout/Header.vue";
export default {
  components: { Header },
  data() {
    return {
      form: {
        nama_sertifikasi: "",
        dosen_pengampu: "",
        hari: "",
        jam: "",
        tanggal: "",
      },
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
    onSubmit() {
      let data = JSON.stringify({
        nama_sertifikasi: this.form.nama_sertifikasi,
        dosen_pengampu: this.form.dosen_pengampu,
        hari: this.form.hari,
        jam: this.form.jam,
        tanggal: this.form.tanggal,
      });
      axios
        .post("http://localhost/api-sertifikasi/sertifikasi/create.php", data)
        .then(async res => {
          const data = await res;
          if (data.status == 200) {
            alert("Data Berhasil Dikirim");
            this.$router.push("read");
          }
        })
        .catch(err => {
          alert("Data Gagal Dikirim");
          console.log(err);
        });
    }
  },
};
</script>

<style lang="stylus" scoped></style>
