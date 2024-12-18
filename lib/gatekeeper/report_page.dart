import 'package:flutter/material.dart';
import 'package:kickpass/list/ticket_list.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulasi data tiket terjual dan jumlah orang yang masuk
    List<Map<String, dynamic>> reportData = [
      {
        "title": "Manchester United vs Manchester City",
        "location": "Stadion Utama",
        "date": "2024-07-01",
        "soldTickets": 150, // Total tiket terjual
        "checkedIn": 120, // Jumlah orang yang sudah masuk
      },
      {
        "title": "Liverpool vs Juventus",
        "location": "Stadion Jaya Raya",
        "date": "2024-07-02",
        "soldTickets": 200,
        "checkedIn": 150,
      },
      {
        "title": "Barcelona vs Paris Saint German",
        "location": "Stadion Nasional",
        "date": "2024-07-03",
        "soldTickets": 180,
        "checkedIn": 130,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Pertandingan"),
        backgroundColor: Color(0xFF426BDE),
      ),
      body: ListView.builder(
        itemCount: reportData.length,
        itemBuilder: (context, index) {
          final match = reportData[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    match["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Lokasi: ${match["location"]}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Tanggal: ${match["date"]}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tiket Terjual: ${match["soldTickets"]}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sudah Masuk: ${match["checkedIn"]}",
                        style: const TextStyle(
                            fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
