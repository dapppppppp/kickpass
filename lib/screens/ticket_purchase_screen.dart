import 'package:flutter/material.dart';
import 'package:kickpass/list/ticket_list.dart';
import 'package:kickpass/list/user_details.dart';

class TicketPurchaseScreen extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String price;
  final String category; // Menambahkan kategori

  // Konstruktor untuk menerima data
  const TicketPurchaseScreen({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.price,
    required this.category, // Menerima kategori
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelian Tiket'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Detail Pembeli Section
              const Text(
                'Detail Pembeli',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Pembeli
                    Text(
                      'Nama Pembeli',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    // Status Face Recognition
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Status Face Recognition',
                          style: TextStyle(fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Toggle status Face Recognition
                            // Ganti dengan logika untuk toggle status
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF426BDE),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'On',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Detail Tiket Section
              const Text(
                'Detail Tiket',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Pertandingan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nama Pertandingan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Tanggal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tanggal'),
                        Text(date),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Waktu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Waktu'),
                        Text(time),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Jumlah Tiket (Pasti 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Jumlah'),
                        const Text('1'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Kategori
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Kategori'),
                        Text(category),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    // Harga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Harga:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          price,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Bayar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Pembayaran Berhasil'),
                        content:
                            const Text('Tiket telah tersimpan di profil Anda.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('OK',
                                style: TextStyle(color: Color(0xFF426BDE))),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          const Size(double.infinity, 50), // Lebar full
                      backgroundColor: const Color(0xFF426BDE),
                      foregroundColor: Colors.white),
                  child: const Text(
                    'Bayar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
