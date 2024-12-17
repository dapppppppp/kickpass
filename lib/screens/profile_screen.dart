import 'package:flutter/material.dart';
import 'package:kickpass/Auth/Login_screen.dart';
import 'package:kickpass/list/user_details.dart';
import 'package:kickpass/screens/face_detection_screen.dart';
import 'package:kickpass/screens/profile_details_screen.dart';
import 'package:kickpass/screens/face_recognition_screen.dart';


// Untuk mengakses Login Page, caranya:
// 1. Logout dulu
// 2. Login belum ada konfigurasinya, jadi hanya untuk pindah ke halaman Gate Keeper
// 3. Username = penjaga
// 4. Password = 12345
// Sekali lagi, login hanya untuk pindah ke halaman Gate Keeper
// Karena aku ngak tau mau ditaruh mana, sekian, terima kasih

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Fungsi untuk menampilkan dialog konfirmasi logout
  Future<void> _showLogoutDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: [
            // Tombol Tidak
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tidak', style: TextStyle(color: Color(0xFF426BDE))),
            ),
            // Tombol Iya
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Iya',
                style: TextStyle(color: Color(0xFF426BDE)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF426BDE),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user_photo.png'),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  user.username,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileDetailsScreen()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.settings, color: Color(0xFF426BDE)),
                  title: Text('Setelan'),
                  subtitle: Text(
                    'Atur profilmu disini',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              ),
            elevation: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                MaterialPageRoute(
              builder: (context) => FaceRecognitionScreen(),
            ),
          );
        },
    child: const ListTile(
      leading: Icon(Icons.camera_alt, color: Color(0xFF426BDE)),
      title: Text('Deteksi Wajah'),
      subtitle: Text(
        'Belum Ada Data Face Recognition',
        style: TextStyle(fontSize: 12),
      ),
    ),
  ),
),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 239, 77, 65),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Tampilkan dialog konfirmasi logout
                _showLogoutDialog(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
