import 'package:flutter/material.dart';
import 'package:kickpass/Auth/login_screen.dart';
import 'package:kickpass/gatekeeper/scan_details_screen.dart';
import 'package:kickpass/list/ticket_list.dart';
import 'profile_gatekeeper.dart';
import 'ticket_gatekeeper.dart';
import 'CustomNavBar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  List<Map<String, String>> filteredMatches = [];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TicketScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreenGK()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    filteredMatches = ticketList;
  }

  void _filterMatches(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMatches = ticketList;
      } else {
        filteredMatches = ticketList
            .where((match) =>
                match["title"]!.toLowerCase().contains(query.toLowerCase()) ||
                match["location"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

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
        title: const Text('Scan Tiket', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF426BDE),
      ),
      body: Column(
        children: [
          // Kolom pencarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari pertandingan atau stadion...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: _filterMatches,
            ),
          ),
          // List pertandingan
          Expanded(
            child: ListView.builder(
              itemCount: filteredMatches.length,
              itemBuilder: (context, index) {
                final match = filteredMatches[index];
                return GestureDetector(
                  onTap: () {
                    // Pindah ke halaman MatchDetailsScreen saat Card di-tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScanDetailsScreen(
                          match: match,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            match["location"] ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Divider(thickness: 1),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  match["title"]?.split(" vs ")[0] ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const Text(
                                "VS",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Text(
                                  match["title"]?.split(" vs ")[1] ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const Divider(thickness: 1),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tanggal",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                match["date"] ?? "",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Waktu",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                match["time"] ?? "",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
