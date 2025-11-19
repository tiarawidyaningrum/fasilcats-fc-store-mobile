# Menjawab Pertanyaan Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
JSON yang diterima bersifat dynamic (Map<String, dynamic>), sehingga rawan kesalahan tipe.
Dengan model Dart, setiap field memiliki tipe yang jelas (misalnya String, int, double), sehingga error dapat terdeteksi lebih awal.
Compiler dapat membantu memastikan bahwa tipe data sesuai.

Konsekuensi: Rawan error tipe data. Tidak ada pengecekan null secara otomatis. Kode menjadi sulit dibaca dan dikelola. Perubahan API akan memengaruhi banyak file secara langsung.

## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Package http:
Digunakan untuk request umum seperti GET dan POST tanpa autentikasi cookie.
Cocok untuk akses data publik atau endpoint tanpa session.

CookieRequest:
Disediakan oleh package pbp_django_auth.
Menyimpan dan mengirim cookie session Django secara otomatis.
Digunakan pada fitur yang memerlukan autentikasi seperti login, logout, dan form create product.

## 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter. 
Karena:
CookieRequest menyimpan session user (cookie Django).
Jika setiap halaman membuat instance sendiri, maka:
cookie tidak konsisten,
user dianggap logout di halaman lain,
autentikasi tidak berjalan.

Dengan membaginya melalui Provider:
semua widget memakai session yang sama,
user tetap login di seluruh aplikasi,
sinkronisasi data dan state dapat terjaga.

## 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
10.0.2.2 adalah alamat khusus Android Emulator yang mengarah ke localhost komputer pengembang.
Tanpa ini, Django akan memblokir request karena dianggap tidak aman.

Flutter (mobile) adalah cross-origin client.
Jika CORS dimatikan, Django akan menolak semua request dari aplikasi.

Cookie Django default-nya SameSite=Lax, tidak mengizinkan cookie dikirim dari aplikasi non-browser.
Harus diubah ke "None" agar Flutter dapat mengirim session cookie.

<uses-permission android:name="android.permission.INTERNET"/>
Tanpa ini, aplikasi tidak dapat melakukan request ke Django sama sekali.

jika salah:
Flutter tidak bisa login (cookie tidak terkirim).
Request ke Django error 403 Forbidden atau CORS policy blocked.
Fetch data gagal atau timeout.
Aplikasi tidak dapat memuat atau mengirim data.

## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
User mengisi form (contoh: Create Product).
Controller menangkap seluruh input.
Data dikonversi menjadi JSON.
JSON dikirim ke Django melalui CookieRequest.post().
Django memproses request: membaca JSON, memvalidasi,menyimpan ke database.
Django mengembalikan respons JSON (status: success).
Flutter menerima respons, lalu: menampilkan snackbar “Berhasil menambahkan produk”, menavigasi kembali ke halaman list product.
Halaman list memanggil endpoint GET Django untuk mengambil data terbaru.
JSON diterjemahkan menjadi model Dart.
Flutter menampilkan daftar product secara dinamis.

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
a. Register

Flutter mengirim data akun baru ke Django.

Django membuat user baru di database.

Django mengembalikan respons JSON success.

b. Login

Flutter mengirim username & password menggunakan CookieRequest.login().

Django memverifikasi user:

jika benar → Django membuat session cookie,

cookie disimpan secara otomatis oleh CookieRequest.

Flutter menampilkan halaman main menu.

c. Logout

Flutter memanggil CookieRequest.logout().

Django menghapus session di server.

Cookie di Flutter dibersihkan.

Aplikasi kembali ke halaman login.

## 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Berikut langkah-langkah yang benar-benar saya lakukan (bukan sekadar mengikuti tutorial):

Langkah 1 — Menyiapkan Endpoint Django

Membuat view create_product_flutter.

Menambahkan route pada urls.py.

Mengaktifkan CORS dan SameSite.

Menambahkan 10.0.2.2 di ALLOWED_HOSTS.

Langkah 2 — Menambahkan Dependency Flutter

Instal package:

provider

http

pbp_django_auth

Langkah 3 — Setup CookieRequest Provider

Menambahkan ChangeNotifierProvider(create: (_) => CookieRequest()) pada main.dart.

Langkah 4 — Membuat Model Product

Generate model Dart dari JSON Django.

Implementasi fromJson() dan toJson().

Langkah 5 — Fetch Data Product

Menggunakan http.get untuk endpoint publik.

Mengonversi JSON → model Product.

Langkah 6 — Membuat Form Input Product Flutter

Membuat controller:

nameController

descriptionController

priceController

Membuat button “Save” yang mengirim POST ke Django.

Langkah 7 — Integrasi Login & Logout

Implementasi form login.

Memanggil request.login().

Menyimpan session ke provider.

Langkah 8 — Testing dan Debugging

Testing error CORS.

Testing validasi model Dart.

Verifikasi: create, fetch, login, logout.

Langkah 9 — Dokumentasi & Push ke GitHub

Menulis README ini.

Melakukan git add, git commit, dan git push.
