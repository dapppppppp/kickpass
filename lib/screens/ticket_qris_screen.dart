import 'package:flutter/material.dart';
import 'package:kickpass/screens/buy_ticket_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketQrisScreen extends StatelessWidget {
  final String title;
  final String price;

  const TicketQrisScreen({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    String qrisCode =
        "https://example.com/qris?title=$title&price=$price"; // URL QRIS

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran QRIS'),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo Image
                        Image.asset(
                          'assets/images/Logo.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 20),
                        // Match Name
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 20),
                        // Price Text (Bold)
                        Text(
                          'Harga: $price',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // QR Code Widget
                        QrImageView(
                          data: qrisCode,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                        const SizedBox(height: 20),
                        Divider(),
                        const SizedBox(height: 20),
                        // Download Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _showDownloadDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF426BDE),
                            ),
                            child: const Text(
                              'Unduh QRIS',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )))),
    );
  }

  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('QRIS Telah Disimpan'),
          content: const Text('Kode QRIS telah disimpan ke ponsel Anda.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF426BDE)),
              ),
            ),
          ],
        );
      },
    );
  }
}
