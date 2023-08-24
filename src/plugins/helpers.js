/* eslint-disable */

import jsPDF from "jspdf";
import "jspdf-autotable";
const doc = new jsPDF();

class Helpers {
    printPdf(data) {

        doc.text(17, 15, "Daftar Peserta Sertifikasi");
        doc.autoTable({
            startY: 20,
            head: [
                ["No", "NIM", "Nama", "Jurusan", "Pilihan1", "Pilihan2", "Pilihan3"],
            ],
            body: data.map((newVal, idx) => {
            return [
                idx + 1,
                newVal.nim,
                newVal.nama,
                newVal.jurusan,
                newVal.pilihan1,
                newVal.pilihan2,
                newVal.pilihan3,
            ];
            }),
        });

        // doc.save("table.pdf");
        doc.autoPrint();
        doc.output('dataurlnewwindow');
    }
    printSertifikasi(data) {
        doc.text(17, 15, "Jadwal Sertifikasi");
        doc.autoTable({
            startY: 20,
            head: [
                ["No", "Nama Sertifikasi", "Dosen Pengampu", "Hari", "Jam", "Tanggal"],
            ],
            body: data.map((newVal, idx) => {
            return [
                idx + 1,
                newVal.nama_sertifikasi,
                newVal.dosen_pengampu,
                newVal.hari,
                newVal.jam,
                newVal.tanggal
            ];
            }),
        });

        // doc.save("table.pdf");
        doc.autoPrint();
        doc.output('dataurlnewwindow');
    }
}

export default new Helpers();
