import 'package:flutter/material.dart';

class FaceDetectionScreen extends StatefulWidget {
  @override
  _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deteksi Wajah'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deteksi Wajah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deteksi Wajah',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isSwitchOn, 
                  onChanged: (bool value) {
                    setState(() {
                      isSwitchOn = value; 
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Ambil Foto Section
            Text(
              'Ambil Foto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Center(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.camera_alt,
                        size: 100, color: Colors.grey),
                    onPressed: () {
                      // Handle camera click here
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
