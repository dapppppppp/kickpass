import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user_photo.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'user1',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text('Member Access', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: const ListTile(
                leading: Icon(Icons.phone, color: Colors.blue),
                title: Text('Nomor Telepon'),
                subtitle: Text('+628123456789'),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: const ListTile(
                leading: Icon(Icons.camera, color: Colors.blue),
                title: Text('Face Recognition'),
                subtitle: Text('Belum Terdaftar'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 239, 77, 65),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Tambahkan fungsi logout
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout', style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
