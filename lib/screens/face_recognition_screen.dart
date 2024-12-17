import 'package:flutter/material.dart';

class FaceRecognitionScreen extends StatefulWidget {
  const FaceRecognitionScreen({super.key});

  @override
  State<FaceRecognitionScreen> createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {
  bool _isRegistering = false;
  String _statusMessage = "Silakan masukkan data Anda terlebih dahulu.";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Fungsi untuk memulai registrasi face recognition
  Future<void> _startFaceRegistration() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistering = true;
        _statusMessage = "Sedang memproses... Mohon tunggu.";
      });

      // Simulasi proses registrasi dengan delay
      await Future.delayed(const Duration(seconds: 3));

      setState(() {
        _isRegistering = false;
        _statusMessage = "Registrasi wajah berhasil!";
      });

      // Tambahkan logika untuk menyimpan data wajah di sini
    } else {
      setState(() {
        _statusMessage = "Silakan lengkapi data dengan benar.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deteksi Wajah',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF426BDE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.face,
                size: 100,
                color: Color(0xFF426BDE),
              ),
              const SizedBox(height: 16),
              Text(
                _statusMessage,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nikController,
                      decoration: const InputDecoration(
                        labelText: "NIK",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "NIK tidak boleh kosong.";
                        }
                        if (value.length != 16) {
                          return "NIK harus terdiri dari 16 digit.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama lengkap tidak boleh kosong.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: "Alamat",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Alamat tidak boleh kosong.";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF426BDE),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _isRegistering ? null : _startFaceRegistration,
                child: _isRegistering
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Mulai Registrasi Wajah',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
