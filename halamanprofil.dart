import 'package:flutter/material.dart';

void main() {
  runApp(DesainHalamanProfil());
}

class DesainHalamanProfil extends StatelessWidget {
  const DesainHalamanProfil({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile picture section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                radius: 70, // Adjust radius for the size of the circle
                backgroundImage: NetworkImage(
                  'https://example.com/profile.jpg', // Replace with an actual image URL or asset
                ),
              ),
            ),
            
            // Username section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Wildan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Bio section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Aplikasi ini adalah sebuah aplikasi dengan tema pembelian alatmusik sederhana yang memungkinkan pengguna untuk menelusuri, membeli produk, dan melihat riwayat pembelian mereka. Desainnya menggunakan Flutter, yang memungkinkan pembuatan antarmuka yang responsif dan menarik untuk perangkat mobile.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),

            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Action when the button is pressed (e.g., edit profile)
                  print('Edit Profile button pressed');
                },
                child: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            // Additional information section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email: wildandiarnadzir@gmail.com.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone: +62 821 2927 1379',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Location: bandung, jawa barat',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
