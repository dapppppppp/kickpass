import 'package:flutter/material.dart';
import 'ticket_purchase_screen.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pertandingan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Persija vs Persib',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Tanggal: 10 Nov 2024'),
            const Text('Lokasi: Stadion GBK'),
            const SizedBox(height: 16),
            const Text(
              'Pilih kategori tempat duduk:',
              style: TextStyle(fontSize: 18),
            ),
            ListTile(
              title: const Text('Tribun - Rp 50.000'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketPurchaseScreen(),
                    ),
                  );
                },
                child: const Text('Beli'),
              ),
            ),
            ListTile(
              title: const Text('VIP - Rp 150.000'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketPurchaseScreen(),
                    ),
                  );
                },
                child: const Text('Beli'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
