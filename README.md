# Menjawab Pertanyaan Tugas 7: Elemen Dasar Flutter

## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah struktur hierarki widget di Flutter.  
Setiap widget bisa menjadi induk (parent) atau anak (child).  
Parent mengatur posisi dan tampilan child di dalamnya.

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- **MaterialApp**: Pembungkus utama aplikasi dan pengatur tema.  
- **Scaffold**: Struktur halaman utama (AppBar, Body).  
- **AppBar**: Header dengan judul aplikasi.  
- **Column, Row**: Menyusun widget secara vertikal/horizontal.  
- **Card**: Menampilkan data dalam kotak dengan bayangan.  
- **Text**: Menampilkan tulisan.  
- **GridView.count**: Menampilkan tombol dalam grid 3 kolom.  
- **Material, InkWell**: Memberi efek klik dan warna.  
- **Icon**: Menampilkan ikon pada tombol.  
- **SnackBar**: Menampilkan pesan sementara di bawah layar.  
- **Padding, SizedBox, Container**: Mengatur jarak dan ukuran elemen.

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
`MaterialApp` mengatur tema, title, dan navigasi aplikasi.  
Widget ini digunakan sebagai root karena menyediakan fitur Material Design yang lengkap.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
- **StatelessWidget**: Tidak berubah, cocok untuk tampilan statis.  
- **StatefulWidget**: Dapat berubah seiring interaksi/data.  
Digunakan `StatelessWidget` karena tampilan aplikasi ini tidak berubah dinamis.

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
`BuildContext` menunjukkan posisi widget dalam widget tree.  
Digunakan untuk mengakses elemen lain seperti tema, navigator, atau menampilkan SnackBar di dalam `build()`.

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
- **Hot Reload**: Memperbarui UI tanpa kehilangan state.  
- **Hot Restart**: Menjalankan ulang seluruh aplikasi dari awal.  
Hot reload digunakan untuk perubahan kecil, hot restart untuk perubahan besar.