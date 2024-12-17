import 'package:flutter/material.dart';
import 'package:kickpass/Auth/Login_screen.dart';
import 'package:kickpass/list/user_details.dart';
import 'package:kickpass/screens/profile_details_screen.dart';
import 'CustomNAvBar.dart'; 
import 'scan_screen.dart';
import 'ticket_gatekeeper.dart';

class ProfileScreenGK extends StatefulWidget {
  const ProfileScreenGK({super.key});

  @override
  _ProfileScreenGKState createState() => _ProfileScreenGKState();
}

class _ProfileScreenGKState extends State<ProfileScreenGK> {
  int _selectedIndex = 2; 

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

  // Fungsi untuk mengganti halaman berdasarkan index navbar
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScanPage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TicketScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Gatekeeper', style: TextStyle(color: Colors.white)),
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
                  'Gatekeeper Account',
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
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      // Tambahkan Custom Bottom Navigation Bar di sini
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
