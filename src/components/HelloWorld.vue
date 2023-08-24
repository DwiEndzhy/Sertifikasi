<template>
  <div class="hello">
    <div class="container h-100">
      <div class="row h-100 justify-content-center align-items-center">
        <div class="card w-50">
          <div class="card-body">
            <h4 class="card-title text-center mb-4">Login</h4>
            <div class="dropdown-divider"></div>
            <form class="my-4" @submit.prevent="onSubmit">
              <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required v-model="form.username">
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required v-model="form.password">
              </div>
              <div class="form-group">
                <label for="level">Level</label>
                <select class="form-control" name="level" id="level" v-model="form.level">
                  <option value="">--Pilih Level--</option>
                  <option value="">Admin</option>
                  <option value="">Mahasiswa</option>
                </select>
              </div>
              <div class="dropdown-divider my-4"></div>
              <div class="form-group text-center">
                <button type="submit" class="btn btn-primary w-50" name="submit" value="submit">Login</button>
              </div>
              <h6>belum punya akun ? <a href="register.html">Register</a></h6>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        username: '',
        password: '',
        level: ''
      }
    }
  },
  methods: {
    onSumbit(e){
      e.preventDefault();
      console.log("login");
    }
  },
}
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
