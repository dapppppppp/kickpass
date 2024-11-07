import 'package:flutter/material.dart';

class BuyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Ticket'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Daftar Tiket yang Tersedia',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
