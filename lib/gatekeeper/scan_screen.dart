import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Page'),
      ),
      body: Center(
        child: Text('Selamat datang di Scan Page!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
