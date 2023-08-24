import Vue from 'vue';

const login = (nama, email, password, role) => Vue.prototype.$api.post('/auth/login.php', {
    nama,
    email,
    password,
    role
});
const register = (nama, email, password, role) =>
  Vue.prototype.$api.post("/auth/register.php", {
    nama,
    email,
    password,
    role
  });

export default { login, register };
