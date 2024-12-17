import 'package:flutter/material.dart';
import 'ticket_purchase_screen.dart';

class MatchDetailsScreen extends StatelessWidget {
  final Map<String, String> match;

  const MatchDetailsScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(match["title"] ?? "Detail Pertandingan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/Logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Lokasi'),
                        Text(match["location"] ?? "N/A"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tanggal'),
                        Text(match["date"] ?? "N/A"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Waktu'),
                        Text(match["time"] ?? "N/A"),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              match["title"]?.split(" vs ")[0] ?? "Team 1",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Image.network(
                              match["team1_logo"] ?? "",
                              width: 90,
                              height: 90,
                            ),
                          ],
                        ),
                        const Text(
                          "VS",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              match["title"]?.split(" vs ")[1] ?? "Team 2",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Image.network(
                              match["team2_logo"] ?? "",
                              width: 90,
                              height: 90,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text(
                      'Pilih kategori tempat duduk:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _ticketCategoryWidget(
                          "Tribun", // Kategori Tribun
                          match["price_tribun"] ?? "N/A",
                          "Stok: ${match["stock_tribun"] ?? "N/A"}",
                          context,
                        ),
                        _ticketCategoryWidget(
                          "VIP", // Kategori VIP
                          match["price_vip"] ?? "N/A",
                          "Stok: ${match["stock_vip"] ?? "N/A"}",
                          context,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ticketCategoryWidget(
      String category, String price, String stock, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$stock tersisa',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Tentukan harga berdasarkan kategori yang dipilih
                  String ticketPrice = category == "Tribun"
                      ? match["price_tribun"] ??
                          "N/A" // Gunakan harga untuk Tribun
                      : match["price_vip"] ?? "N/A"; // Gunakan harga untuk VIP

                  // Pindah ke halaman transaksi dengan data yang diteruskan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketPurchaseScreen(
                        title: match["title"] ??
                            "N/A", // Mengambil title pertandingan
                        date: match["date"] ??
                            "N/A", // Mengambil tanggal pertandingan
                        time: match["time"] ??
                            "N/A", // Mengambil waktu pertandingan
                        price: ticketPrice, // Mengambil harga sesuai kategori
                        category: category, // Menambahkan kategori yang dipilih
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF426BDE),
                  minimumSize: Size(150, 50),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Beli'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
