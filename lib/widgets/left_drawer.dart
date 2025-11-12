import 'package:flutter/material.dart';
import 'package:fasilcats_fc_store_mobile/screens/menu.dart';
import 'package:fasilcats_fc_store_mobile/screens/productlist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Bagian drawer header
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                Text(
                  'FasilCats FC Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Temukan perlengkapan sepak bola terbaik di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Navigasi ke halaman utama
          // Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
              ));
            },
          ),
          // Navigasi ke halaman tambah produk
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            // Bagian redirection ke NewsFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductFormPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}
