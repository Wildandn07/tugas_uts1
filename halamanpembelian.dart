import 'package:flutter/material.dart';

class DesainHalamanPembelian extends StatefulWidget {
  const DesainHalamanPembelian({super.key});

  @override
  State<DesainHalamanPembelian> createState() => _DesainHalamanPembelianState();
}

class _DesainHalamanPembelianState extends State<DesainHalamanPembelian> {
  // Daftar produk
  final List<Map<String, String>> products = [
    {
      'name': 'Produk gitar bass',
      'description': 'Deskripsi produk A',
      'price': 'Rp 100.000',
      'image': 'assets/images/bass.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk Produk gitar listrik',
      'description': 'Deskripsi produk B',
      'price': 'Rp 150.000',
      'image': 'assets/images/Gitar_Listrik.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk drum',
      'description': 'Deskripsi produk C',
      'price': 'Rp 200.000',
      'image': 'assets/images/drum.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk biola',
      'description': 'Deskripsi produk D',
      'price': 'Rp 500.000',
      'image': 'assets/images/biola.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk piano',
      'description': 'Deskripsi produk E',
      'price': 'Rp 250.000',
      'image': 'assets/images/piano.jpg', // Ganti dengan gambar produk yang sesuai
    },
    {
      'name': 'Produk gitar akustik',
      'description': 'Deskripsi produk F',
      'price': 'Rp 400.000',
      'image': 'assets/images/akustik.jpg', // Ganti dengan gambar produk yang sesuai
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pembelian'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Image.asset(
                product['image'] ?? '',
                width: 60,
                height: 60,
              ),
              title: Text(product['name'] ?? ''),
              subtitle: Text(product['description'] ?? ''),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product['price'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      // Tindakan ketika tombol beli ditekan
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pembelian berhasil!')),
                      );
                    },
                    child: const Text('Beli'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
