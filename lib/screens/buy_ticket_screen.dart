import 'package:flutter/material.dart';

class BuyTicketScreen extends StatelessWidget {
  const BuyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Ticket'),
        backgroundColor:  Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Daftar Tiket yang Tersedia',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
