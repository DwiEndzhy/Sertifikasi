<template>
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
                <a class="nav-link" href="/admin/peserta">
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
</template>
