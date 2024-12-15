import 'package:flutter/material.dart';
import 'package:kickpass/list/transaction_list.dart';
import 'package:kickpass/list/user_details.dart';

class GetUserScreen extends StatelessWidget {
  final String ticketCode;

  const GetUserScreen({super.key, required this.ticketCode});

  @override
  Widget build(BuildContext context) {
    // Mencari data transaksi berdasarkan kode tiket
    var ticket = transactionList.firstWhere(
      (transaction) => transaction['kode_tiket'] == ticketCode,
      orElse: () => {},
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pembeli'),
      ),
      body: ticket.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/images/Logo.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),
                      // Nama pertandingan
                      Text(
                        ticket['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),

                      // Nama pembeli
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Kode tiket
                      Text(
                        ticket['kode_tiket']!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),

                      // Lokasi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lokasi",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${ticket['location']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Tanggal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tanggal",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${ticket['date']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Waktu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Waktu",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${ticket['time']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Kategori
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kategori",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${ticket['category']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
                'Ticket not found!',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
    );
  }
}
