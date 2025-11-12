# Menjawab Pertanyaan Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
-Navigator.push()
Menambahkan route baru ke atas tumpukan navigasi.
Halaman sebelumnya tidak dihapus dan dapat diakses kembali menggunakan tombol Back.

Digunakan saat menekan tombol "Create Product" pada halaman utama (di dalam product_card.dart).

-Navigator.pushReplacement()
Menggantikan route yang sedang aktif dengan route baru
Halaman sebelumnya dihapus dari tumpukan, sehingga pengguna tidak bisa kembali ke halaman tersebut.

Digunakan dalam widget LeftDrawer saat menavigasi antar halaman utama (misalnya dari halaman Form kembali ke "Home" atau sebaliknya).

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBarWidget tree adalah struktur hierarki widget di Flutter.  
Pemanfaatan hierarchy widget tersebut berfungsi sebagai kerangka Material Design yang konsisten:
-Scaffold: Berfungsi sebagai kerangka dasar setiap halaman. Dengan menggunakan Scaffold di setiap screen (menu.dart dan productlist_form.dart), kita memastikan setiap halaman memiliki struktur yang terstandardisasi (memiliki tempat untuk body, appBar, dan drawer).

-AppBar: Disediakan oleh Scaffold untuk menyediakan bilah atas yang konsisten. Setiap AppBar menggunakan warna tema (Theme.of(context).colorScheme.primary) dan tata letak judul yang konsisten, sekaligus secara otomatis menampilkan ikon menu hamburger (jika Drawer disediakan) yang menjadi titik akses universal untuk navigasi.

-Drawer: Widget LeftDrawer yang sama diimpor dan dipasang pada properti drawer di semua Scaffold. Hal ini memastikan bahwa menu navigasi utama aplikasi (Home dan Add Product) dapat diakses melalui gestur geser dari kiri atau melalui ikon menu di AppBar secara konsisten di setiap halaman.

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
-SingleChildScrollView
Membuat seluruh konten form dapat digulir (scrollable). Ini mencegah input field yang berada di bawah terpotong atau tertutup oleh keyboard virtual pada perangkat kecil.

Digunakan sebagai child dari Form di ProductFormPage (lib/screens/productlist_form.dart) untuk membungkus Column yang berisi semua input.

-Padding
Menciptakan ruang kosong yang jelas antara setiap elemen input dan batas layar. Ini membuat form lebih mudah dibaca dan mengurangi kemungkinan pengguna salah menekan field (meningkatkan touch target).

Digunakan untuk membungkus setiap TextFormField, DropdownButtonFormField, dan SwitchListTile di ProductFormPage (lib/screens/productlist_form.dart) dengan const EdgeInsets.all(8.0).

-ListView
Digunakan di Drawer (lib/widgets/left_drawer.dart) untuk menampung daftar item navigasi (ListTile). Keuntungannya adalah otomatis mengelola tata letak daftar vertikal dan membuatnya dapat digulir jika menu terlalu panjang.

Digunakan sebagai child utama dari Drawer di lib/widgets/left_drawer.dart.

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Penyesuaian warna tema dilakukan secara terpusat di widget utama aplikasi, yaitu MyApp yang terletak di file lib/main.dart.

Pengaturan Tema Sentral: Warna brand toko (FasilCats FC) diterapkan melalui ThemeData dengan menentukan primarySwatch pada ColorScheme.

Implementasi:
theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.grey),
      ),

Konsistensi Otomatis: Dengan mengatur primarySwatch: Colors.red, Flutter secara otomatis menerapkan warna Merah ini sebagai warna utama (colorScheme.primary) pada berbagai elemen di seluruh aplikasi.

Ini menjamin bahwa identitas visual brand (Merah) konsisten di seluruh elemen utama aplikasi.