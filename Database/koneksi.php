<?php

$koneksi = mysqli_connect("localhost", "root", "", "db_dictionary");

if ($koneksi) {

    // echo "Database berhasil konek";

} else {
    echo "gagal Connect";
}
