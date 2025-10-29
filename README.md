# Tugas Individu 7
29 Oktober 2025, Introduction To Flutter

## Widget Tree Pada Flutter
Widget Tree pada Flutter menjelaskan jika tiap app punya widget utamanya (sebagai contoh di main.dart) yang disebut sebagai parent, lalu pada widget utama tersebut mempunyai widget cabang yang disebut sebagai child dan berada di dalam widget parentnya. Singkatnya, widget tree punya hubungan parent-child untuk mendefiniskan objek mana yang harus terimplement didalamnya.

## Football_Shop Widget
Ada dua widget, yang pertama ada di main.dart dengan return value MaterialApp digunakan untuk menginisiasi home site dari suatu app, yang kedua ada di menu.dart dengan return value Material digunakan untuk membentuk sebuah widget-children dari main.dart (yang sudah diimport) dengan beberapa elemen stylesheet berupa tombol berwarna dan snackbar sebagai responnya.

## MaterialApp Widget
MaterialApp adalah sebuah class yang berisi banyak atribut/method untuk mengkustomisasi app. MaterialApp digunakan sebagai widget root karena method/atribut dari MaterialApp memang digunakan sebagai inisiator dari sebuah app (seperti home, route, dan lainnya).

## Stateless/Stateful Widget
Sebuah widget yang dikatakan stateful, ketika widget tersebut memiliki aksi nyata saat dilakukan sebuah event dari User dan terdapat fungsi yang merespons event tersebut seperti tombol increment di awal inisiasi flutter. Demikian stateless berupa kebalikan dari stateful.

Kapan kita memakai widget yang stateful? saat kita ingin memberikan interaksi pada user, jika tidak perlu cukup stateless saja.

## BuildContext
BuildContext adalah sebuah abstract class yang digunakan untuk menghandle lokasi dari suatu widget pada widget tree. BuildContext penting sebagai kerangka dari suatu widget, dengan method yang diberikan-diimplementasikan widget yang dibentuk akan terstruktur.

## Hot Reload/Restart
Hot Reload adalah suatu command untuk mengaplikasikan perubahan kode dengan menjaga state dari app yang sudah di run, sedangkan Hot Restart tidak menjaga state tersebut. Dengan demikian, perbedaan ada di runtime dan state akhir app.

## Navigasi Pindah Layar Pada Flutter
Navigasi dilakukan dengan menggunakan class Navigator dan Route. Navigator.push() digunakan untuk berpindah ke halaman baru (menambahkan route ke stack), sedangkan Navigator.pop() digunakan untuk kembali ke halaman sebelumnya (menghapus route dari stack). Dengan demikian, navigasi pada Flutter bekerja seperti tumpukan (stack) di mana halaman yang terakhir dibuka akan berada di atas dan dapat ditutup untuk kembali ke halaman sebelumnya.
