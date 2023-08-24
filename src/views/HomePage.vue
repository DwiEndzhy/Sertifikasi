<template>
  <div class="container mt-2">
    <Header />
    <section class="tampilan mt-2">
      <div class="jumbotron">
        <h1 style="text-align:center; font-weight:bold;">
          SELAMAT DATANG DI WEBSITE
        </h1>
        <br />
        <h5 style="text-align:center; font-weight:bold;">
          PENDAFTARAN SERTIFIKASI
        </h5>
        <br />
        <h5 style="text-align:center; font-weight:bold;">
          STMIK AKAKOM YOGYAKARTA
        </h5>
      </div>
    </section>
    <section class="footer mt-2">
      <div class="footer">
        <div class="bottom section-padding">
          <div class="container">
            <div class="row">
              <div class="col-md-12 text-center">
                <div class="copyright">
                  <p>
                    ©
                    <span>2021</span>
                    <a href="#" class="transition">STMIK AKAKOM YOGYAKARTA</a>
                    All rights reserved.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import Header from "@/components/_layout/HeaderNoLogin.vue";
export default {
  components: { Header },
};
</script>

<style>
.bloc_left_price {
  color: #c01508;
  text-align: center;
  font-weight: bold;
  font-size: 150%;
}
.category_block li:hover {
  background-color: #007bff;
}
.category_block li:hover a {
  color: #ffffff;
}
.category_block li a {
  color: #343a40;
}
.add_to_cart_block .price {
  color: #c01508;
  text-align: center;
  font-weight: bold;
  font-size: 200%;
  margin-bottom: 0;
}
.add_to_cart_block .price_discounted {
  color: #343a40;
  text-align: center;
  text-decoration: line-through;
  font-size: 140%;
}
.product_rassurance {
  padding: 10px;
  margin-top: 15px;
  background: #ffffff;
  border: 1px solid #6c757d;
  color: #6c757d;
}
.product_rassurance .list-inline {
  margin-bottom: 0;
  text-transform: uppercase;
  text-align: center;
}
.product_rassurance .list-inline li:hover {
  color: #343a40;
}
.reviews_product .fa-star {
  color: gold;
}
.pagination {
  margin-top: 20px;
}
a:hover {
  text-decoration: none;
}
.section-padding {
  padding: 60px 0;
}
.bottom {
  background-color: #0a1c2e;
}
.bottom .copyright {
  color: #e5e5e5;
  font-weight: 600;
}
.copyright a {
  color: #f2ff49;
  margin-left: 3px;
  padding-right: 3px;
}
.bottom p {
  margin-bottom: 0;
  line-height: 50px;
  font-size: 16px;
  font-weight: 400;
}
.copyright p span {
  color: #d1caca;
}
.bottom .copyright p,
.bottom .copyright a:hover {
  color: #6c6d83;
}
</style>
