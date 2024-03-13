<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$sql = "SELECT * FROM word";
$result = $koneksi->query($sql);

if ($result->num_rows > 0) {
    $response['isSuccess'] = true;
    $response['message'] = "Berhasil Menampilkan kata";
    $response['data'] = array();
    while ($row = $result->fetch_assoc()) {
        $response['data'][] = $row;
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Gagal menampilkan kata";
    $response['data'] = null;
}
echo json_encode($response);
