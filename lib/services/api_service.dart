import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  // Fungsi untuk mengirim gambar ke backend Laravel
  Future<Map<String, dynamic>> sendImage(String imagePath) async {
    var uri = Uri.parse('$baseUrl/recognize');
    var request = http.MultipartRequest('POST', uri);

    // Menambahkan file gambar ke request
    var file = await http.MultipartFile.fromPath('image', imagePath);
    request.files.add(file);

    try {
      // Kirim request ke backend
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        return json.decode(responseData);
      } else {
        return {'error': 'Gagal mengirim data: ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'Terjadi kesalahan: $e'};
    }
  }
}
