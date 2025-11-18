# Tugas Individu 9
18 November 2025, API Integration

## Model pada Dart
Model pada Dart dibuat sebagai bentuk konsistensi model pada GET API (kasus ini pada platform Django), jika tidak ada model tersebut dan API hanya menerima mapping tanpa model maka constraint dari model yang ada pada aplikasi sebelumnya bisa terlanggar dan type atribut dari model bisa saja tidak sama dengan model yang sebenarnya.

## CookieRequest vs HTTP
HTTP menyambungkan koneksi user antara backend-frontend, lalu CookieRequest yang nyimpen sesi user. Di tugas ini response diambil dengan http, lalu cookie dari requestnya disimpen dengan CookieRequest dari http response.

## CookieRequest di Setiap Komponen Aplikasi
Instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter karena tiap laman perlu session yang sama.

## Konektivitas Flutter dengan Django
Konfigurasi konektivitas ini sangat penting karena Flutter dan Django beroperasi di lingkungan terpisah (cross-origin dan virtual device). 10.0.2.2 pada ALLOWED_HOSTS Django diperlukan agar Android Emulator dapat mengakses localhost (mesin host Django), sementara mengaktifkan CORS wajib dilakukan karena Flutter dianggap sebagai origin berbeda dan tanpanya permintaan akan diblokir. Pengaturan SameSite/Cookie memastikan cookies sesi dan otentikasi dapat dipertahankan dan dikirim dengan benar di lingkungan cross-site. Terakhir, izin Akses Internet di Android (AndroidManifest.xml) adalah prasyarat mutlak bagi aplikasi untuk melakukan aktivitas jaringan. Jika konfigurasi ini salah, Anda akan menghadapi Connection Refused, CORS Policy Errors, atau Authentication Failures karena sesi login tidak valid.

## Mekanisme Pengiriman Data pada Flutter
Mekanisme pengiriman data dimulai ketika pengguna memberikan input pada widget di Flutter (misalnya, TextField), yang kemudian ditangkap oleh controller atau state management (tugas ini pakai Provider). Data ini lalu dikonversi dari object Dart menjadi format JSON melalui serialisasi (menggunakan metode .toJson() dari model Dart). Client HTTP (misalnya, http atau CookieRequest) kemudian mengirimkan request (POST/PUT) yang berisi JSON tersebut ke endpoint API Django. Django menerima request, memproses data (misalnya, menyimpannya di database melalui modelnya), dan mengirimkan respons JSON. Flutter menerima respons ini, mendeserialisasi JSON kembali menjadi model Dart, memperbarui state aplikasi, dan memicu widget terkait untuk di-rebuild, sehingga data baru dapat ditampilkan kepada pengguna.

## Mekanisme Autentikasi User pada Flutter
Untuk Register dan Login, pengguna memasukkan kredensial pada Flutter, yang dikirim sebagai request POST JSON ke endpoint autentikasi Django. Django memproses kredensial tersebut—menciptakan pengguna baru atau memverifikasi pengguna yang ada. Jika berhasil, Django akan merespons dengan token otorisasi (misalnya, JWT) atau mengatur cookies sesi (sessionid). Flutter menyimpan token atau cookies ini (seringkali menggunakan CookieRequest atau penyimpanan lokal yang aman) untuk digunakan pada semua request API yang memerlukan otorisasi di masa mendatang. Untuk Logout, Flutter mengirim request ke endpoint logout Django yang menghapus sesi di server. Setelah sesi atau token berhasil dihapus dari kedua sisi, Flutter menghapus data autentikasi lokal dan memperbarui state untuk menampilkan menu/halaman guest, menyelesaikan proses autentikasi.

## Implementasi Checklist
Hal yang pertama saya lakukan adalah membuat API pada Django, lalu membuat model pada Dart (pake quicktype) dan menyambungkan Django dan Flutter dengan localhost (termasuk cookie). Setelah itu semuanya tinggal kustomisasi dari instruksi seperti pembuatan laman yang mengfilter sesuai user dan fitur-fitur lainnya.



