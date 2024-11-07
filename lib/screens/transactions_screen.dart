import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Kita'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTransactionCard('Pertandingan 1', 'Berhasil', Icons.check_circle, Colors.green),
          _buildTransactionCard('Pertandingan 2', 'Gagal', Icons.cancel, Colors.red),
          _buildTransactionCard('Pertandingan 3', 'Pending', Icons.hourglass_empty, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(String title, String status, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: color, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Status: $status'),
      ),
    );
  }
}
