import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionScreen extends StatefulWidget {
  @override
  _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  bool isSwitchOn = false;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deteksi Wajah'),
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
                  activeColor: Color(0xFF426BDE),
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
                child: _image == null
                    ? Center(
                        child: IconButton(
                          icon: Icon(Icons.camera_alt,
                              size: 100, color: Colors.grey),
                          onPressed: () {
                            _pickImage();
                          },
                        ),
                      )
                    : Image.file(_image!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
