import 'package:flutter/material.dart';
import 'package:kickpass/gatekeeper/get_user_screen.dart';
import 'package:kickpass/list/transaction_list.dart';

class ScanDetailsScreen extends StatefulWidget {
  final Map<String, String> match;

  const ScanDetailsScreen({super.key, required this.match});

  @override
  _ScanDetailsScreenState createState() => _ScanDetailsScreenState();
}

class _ScanDetailsScreenState extends State<ScanDetailsScreen> {
  // Menyimpan kode tiket yang dimasukkan
  String enteredCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Scan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kotak untuk detail pertandingan
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Judul pertandingan
                  Text(
                    widget.match['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Divider(height: 20, color: Colors.grey),
                  // Lokasi
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(widget.match['location']!),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Tanggal
                  Row(
                    children: [
                      const Icon(Icons.date_range, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(widget.match['date']!),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Jam
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(widget.match['time']!),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Scan Wajah Pembeli
            Column(
              children: [
                const Text(
                  'Scan Wajah Pembeli',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt,
                            size: 100, color: Colors.grey),
                        onPressed: () {
                          // Handle camera click here
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Atau Masukan Kode Tiket
            Column(
              children: [
                const Text(
                  'Atau Masukan Kode Tiket',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                // Form untuk memasukkan kode tiket
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan kode tiket',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),
                  ),
                  onChanged: (String code) {
                    setState(() {
                      enteredCode = code; // Menyimpan nilai kode tiket
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Cek apakah kode tiket valid
                    var transaction = transactionList.firstWhere(
                      (transaction) => transaction["kode_tiket"] == enteredCode,
                      orElse: () => {},
                    );
                    if (transaction.isNotEmpty) {
                      // Jika tiket ditemukan, navigasikan ke GetUserScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GetUserScreen(ticketCode: enteredCode),
                        ),
                      );
                    } else {
                      // Jika tiket tidak ditemukan, tampilkan pesan error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Kode tiket tidak valid')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF426BDE),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Cek',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
