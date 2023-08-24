<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// header("content-type:multipart/form-data");

include_once '../config/koneksi.php';
$database = new Database();
$db = $database->getConnection();


$method = $_SERVER['REQUEST_METHOD'];


$result = array();


// function datamhs(){
//     $sqlQuery= "SELECT * FROM mahasiswa";
// }

if ($method = 'POST') {
    // cek
    if (isset($_POST['nim']) and isset($_POST['nama']) and isset($_POST['jurusan']) and isset($_POST['pilihan1']) and isset($_POST['pilihan2']) and isset($_POST['pilihan3'])) {

        $nim = $_POST['nim'];
        $nama = $_POST['nama'];
        $jurusan = $_POST['jurusan'];
        $pilihan1 = $_POST['pilihan1'];
        $pilihan2 = $_POST['pilihan2'];
        $pilihan3 = $_POST['pilihan3'];

        $foto_tmp = $_FILES['upload_ktm']['tmp_name'];
        $nama_foto = $_FILES['upload_ktm']['name'];
        $direktory = "../image/";

        if (move_uploaded_file($foto_tmp, "$direktory/$nama_foto")) {
            $result['status'] = [
                "code" => 200,
                "description" => '1 data berhasil diinput'

            ];

            $sql = "INSERT INTO mahasiswa (nim, nama, jurusan, pilihan1, pilihan2, pilihan3, upload_ktm)     
        VALUES ('$nim','$nama','$jurusan','$pilihan1','$pilihan2','$pilihan3','$nama_foto') ";

            $db->query($sql);
            $result['result'] = [
                "nim" => $nim,
                "nama" => $nama,
                "jurusan" => $jurusan,
                "pilihan1" => $pilihan1,
                "pilihan2" => $pilihan2,
                "pilihan3" => $pilihan3,
                "upload_ktm" => $nama_foto,
            ];
        } else {
            $result['status'] = [
                "code" => 401,
                "description" => 'data gagal diinputkan',
                "error_message" => $_FILES,
            ];
        }
    }
}
// else{
//     $result['status']=[
//         "code"=>400,
//         "description"=>'not invalid'   
//     ];
// }
echo json_encode($result);
