<template>
  <div class="hello mt-5">
    <div class="container h-100">
      <div class="row h-100 justify-content-center align-items-center">
        <div class="card w-50">
          <div class="card-body">
            <h4 class="card-title text-center mb-4">Register</h4>
            <div class="dropdown-divider"></div>
            <form class="my-4" action="post" @submit.prevent="add">
              <div class="form-group">
                <label for="nama">Nama</label>
                <input
                  type="text"
                  class="form-control"
                  id="nama"
                  name="nama"
                  required
                  v-model="form.nama"
                /></div>
              <div class="form-group">
                <label for="username">Username</label>
                <input
                  type="text"
                  class="form-control"
                  id="username"
                  name="username"
                  required
                  v-model="form.username"
                />
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  name="password"
                  required
                  v-model="form.password"
                />
              </div>
              <div class="dropdown-divider my-4"></div>
              <div class="form-group text-center">
                <button
                  type="submit"
                  class="btn btn-primary w-50"
                  name="submit"
                  value="submit"
                >
                  Register
                </button>
              </div>
              <h6>sudah punya akun ? <a href="/login">Login</a></h6>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

//import authService from "@/service/auth";
import axios from "axios";

export default {
  name: "HelloWorld",
  props: {
    msg: String
  },
  data() {
    return {
      form:{
        nama: "",
        username: "",
        password: ""
      }
    };
  },
  methods: {
    add() {
      axios({
        method: "post",
        url: process.env.VUE_APP_BACKEND + "/sertifikasi_api/user/register.php",
        data: {
          "nama":this.form.nama,
          "username":this.form.username,
          "password":this.form.password
        },
      }).then(async response => {
        const data = await response;
        if (data.status == 200) {
          alert("Daftar User Baru Berhasil")
          this.$router.push("/login");
        }else{
          alert("Daftar User Baru Gagal")
          this.$router.push("/register");
        }
      })
      .catch(function(response) {
        //handle error
        console.log(response);
      });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
