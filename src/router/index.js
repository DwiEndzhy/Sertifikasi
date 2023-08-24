import Vue from 'vue'
import VueRouter from 'vue-router'
import HomePage from '../views/HomePage'

Vue.use(VueRouter)

  const routes = [
  {
    path : '/',
    name : 'HomePage',
    component : HomePage
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import( '../views/Login.vue')
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import( '../views/Register.vue')
  },
  {
    path: '/admin/read',
    name: 'Read',
    component: () => import('../views/admin/Read.vue')
  },
  {
    path: '/admin/insert',
    name: 'Insert',
    component: () => import('../views/admin/Insert.vue')
  },
  {
    path: '/admin/update',
    name: 'Update',
    component: () => import('../views/admin/Update.vue')
  },
  {
    path: '/admin/delete',
    name: 'Delete',
    component: () => import('../views/admin/Delete.vue')
  },
  {
    path: '/admin/peserta',
    name: 'Peserta',
    component: () => import('../views/admin/Peserta.vue')
  },
  {
    path: '/mahasiswa/daftar',
    name: 'daftar',
    component: () => import('../views/mahasiswa/daftar.vue')
  },
  {
    path: '/mahasiswa/jadwal',
    name: 'jadwal',
    component: () => import('../views/mahasiswa/jadwal.vue')
  },
  {
    path: '/mahasiswa/read',
    name: 'readsertifikasi',
    component: () => import('../views/mahasiswa/read.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
