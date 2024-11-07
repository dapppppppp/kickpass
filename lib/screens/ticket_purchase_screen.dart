import 'package:flutter/material.dart';

class TicketPurchaseScreen extends StatelessWidget {
  const TicketPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelian Tiket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Ringkasan Pembelian Tiket',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Pertandingan: Persija vs Persib'),
            const Text('Kategori: VIP'),
            const Text('Harga: Rp 150.000'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk konfirmasi pembayaran
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Pembayaran Berhasil'),
                    content: const Text('Tiket telah tersimpan di profil Anda.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Bayar Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
