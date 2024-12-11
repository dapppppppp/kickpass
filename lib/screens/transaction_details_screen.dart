import 'package:flutter/material.dart';
import 'package:kickpass/list/user_details.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Map<String, String> transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tiket'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Center(
                    child: Image.asset('assets/images/Logo.png', height: 100),
                  ),
                  const SizedBox(height: 16),

                  // Line 1
                  Divider(),

                  // Judul pertandingan
                  Center(
                    child: Text(
                      "${transaction["title"] ?? ""}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Line 2
                  Divider(),

                  // Nama pembeli
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama Pembeli:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${user.name}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Id transaksi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ID Transaksi:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${transaction["id_transaksi"] ?? ""}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Line 3
                  Divider(),

                  // Lokasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lokasi:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${transaction["location"] ?? ""}",
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
                        "Tanggal:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${transaction["date"] ?? ""}",
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
                        "Waktu:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${transaction["time"] ?? ""}",
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
                        "Kategori:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${transaction["category"] ?? ""}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Harga
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga:",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${transaction["price"] ?? ""}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Line 4
                  Divider(),

                  // Kode Tiket
                  Center(
                    child: Text(
                      "Kode Tiket",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Kode tiket
                  Center(
                    child: Text(
                      "${transaction["kode_tiket"] ?? ""}",
                      style: const TextStyle(
                        fontSize: 40, // Larger font size for ticket code
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF426BDE),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Line 5
                  Divider(),

                  // Download tombol
                  SizedBox(
                    width: double
                        .infinity, // Make the button span across the screen
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF426BDE), // Button color
                        padding: const EdgeInsets.symmetric(
                            vertical: 16), // Make button taller
                      ),
                      onPressed: () {
                        // Show the alert dialog when the button is pressed
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Tiket Berhasil Diunduh'),
                              content: const Text(
                                  'Tiket berhasil di download di ponsel Anda.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog when "Ok" is clicked
                                  },
                                  child: const Text(
                                    'Ok',
                                    style: TextStyle(
                                      color:
                                          Color(0xFF426BDE), // Blue text color
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Download Tiket',
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: 16, // Text size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
