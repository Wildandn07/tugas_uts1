import 'dart:io';

import 'package:flutter/material.dart';

import './halamanprofil.dart';
import './pengaturan.dart';

class DesainHalamanUtama extends StatefulWidget {
  const DesainHalamanUtama({super.key});

  @override
  State<DesainHalamanUtama> createState() => _DesainHalamanUtamaState();
}

class _DesainHalamanUtamaState extends State<DesainHalamanUtama> {
  // Daftar produk yang akan ditampilkan di halaman utama
  final List<Map<String, String>> products = [
    {
      'name': 'Produk gitar bass',
      'description': '',
      'price': 'Rp 100.000',
      'image': 'assets/images/bass.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk gitar listrik',
      'description': '',
      'price': 'Rp 150.000',
      'image': 'assets/images/Gitar-Listrik.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk drum',
      'description': '',
      'price': 'Rp 200.000',
      'image': 'assets/images/drum.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk biola',
      'description': '',
      'price': 'Rp 500.000',
      'image': 'assets/images/biola.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk piano',
      'description': '',
      'price': 'Rp 250.000',
      'image': 'assets/images/piano.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk gitar akustik',
      'description': '',
      'price': 'Rp 400.000',
      'image': 'assets/images/akustik.jpg', // Ganti dengan gambar produk yang sesuai
    },
  ];

  // Riwayat pembelian
  List<Map<String, String>> purchaseHistory = [];

  // Fungsi untuk menambahkan pembelian ke riwayat
  void addPurchase(Map<String, String> product) {
    setState(() {
      purchaseHistory.add(product); // Menambahkan produk yang dibeli ke riwayat
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pembelian berhasil!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search icon button
              print('Search tapped');
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(''), fit: BoxFit.cover),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profil.png'),
              ),
            ),
            ListTile(
              title: const Text('Profil'),
              leading: const Icon(Icons.person),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DesainHalamanProfil()),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),
            ListTile(
              title: const Text('Pengaturan'),
              leading: const Icon(Icons.settings),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DesainHalamanPengaturan()),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ),
            ListTile(
              title: const Text('Keluar'),
              leading: const Icon(Icons.close),
              trailing: IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menu Pembelian',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            // Grid layout untuk menampilkan produk secara responsif
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Mengatur jumlah kolom untuk grid
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // Menyesuaikan aspek rasio item grid
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image'] ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['name'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product['price'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol "Beli" ditekan
                              addPurchase(product); // Menambahkan produk ke riwayat pembelian
                            },
                            child: const Text('Beli'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Riwayat Pembelian',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            // Menampilkan riwayat pembelian
            Expanded(
              child: purchaseHistory.isEmpty
                  ? const Center(child: Text('Belum ada pembelian'))
                  : ListView.builder(
                      itemCount: purchaseHistory.length,
                      itemBuilder: (context, index) {
                        final purchase = purchaseHistory[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: Image.asset(
                              purchase['image'] ?? '',
                              width: 60,
                              height: 60,
                            ),
                            title: Text(purchase['name'] ?? ''),
                            subtitle: Text(purchase['description'] ?? ''),
                            trailing: Text(
                              purchase['price'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
