# Tugas Individu 8
5 November 2025, Routing And Form Flutter

## Navigator .push() dan .pushReplacement()
Navigator adalah sebuah class yang berguna untuk routing antar widget dan bekerja seperti stack. Method .push() dan .pushReplacement() pada navigator berguna untuk membuat routing ke suatu widget/page lainnya. Perbedaanya terletak pada kondisi widget lama (sebelum di push), pada .push() widget lama masih tampil (seperti .add() pada stack) sedangkan pada .pushReplacement() widget yang lama diganti dengan widget yang ingin ditampilkan (seperti .pop() lalu .add() pada stack()).

## Hierarchy Widget (Scaffold, AppBar, Drawer)
Hierarchy widget digunakan untuk membangun struktur halaman yang konsisten di seluruh aplikasi. Pemanfaatan hierarki ini membantu menciptakan pola tampilan yang seragam, mudah dipahami pengguna, dan efisien dalam pengembangan. Scaffold menjadi kerangka utama setiap halaman, AppBar menampilkan judul dan navigasi (bar seperti biasa), sedangkan Drawer menyediakan menu navigasi yang sama di semua halaman. Dengan begitu, tampilan dan pengalaman pengguna menjadi seragam dan mudah digunakan.

## Layout Widget (Padding, SingleChildScrollView, ListView)
Widget seperti Padding, SingleChildScrollView, dan ListView membantu menjaga tampilan form agar tetap rapi dan responsif. Padding memberi jarak antar elemen, SingleChildScrollView mencegah overflow dengan memungkinkan scroll, dan ListView memudahkan penataan banyak elemen input secara efisien. Contohnya, pada halaman form terdapat SingleChildScrollView dengan Padding di dalamnya agar form tetap bisa discroll pada layar kecil.

## Konsistensi Warna Tema
Pada main app, inisiasikan warna primary/secondary/n-ary pada theme lalu untuk memakai warna yang sudah diinitiate set color sebagai Theme.of(context).colorScheme.X (x: primary/n-ary dan lainnya). Dengan demikian, warna pada widget akan konsisten sesuai tema yang diberikan.
