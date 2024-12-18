import 'package:flutter/material.dart';

class EditTicketScreen extends StatefulWidget {
  final Map<String, String> match;
  final Function(Map<String, String>) onSave;

  const EditTicketScreen({super.key, required this.match, required this.onSave});

  @override
  _EditTicketScreenState createState() => _EditTicketScreenState();
}

class _EditTicketScreenState extends State<EditTicketScreen> {
  late TextEditingController titleController;
  late TextEditingController locationController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController priceTribunController;
  late TextEditingController stockTribunController;
  late TextEditingController priceVipController;
  late TextEditingController stockVipController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.match["title"]);
    locationController = TextEditingController(text: widget.match["location"]);
    dateController = TextEditingController(text: widget.match["date"]);
    timeController = TextEditingController(text: widget.match["time"]);
    priceTribunController =
        TextEditingController(text: widget.match["price_tribun"]);
    stockTribunController =
        TextEditingController(text: widget.match["stock_tribun"]);
    priceVipController = TextEditingController(text: widget.match["price_vip"]);
    stockVipController = TextEditingController(text: widget.match["stock_vip"]);
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    priceTribunController.dispose();
    stockTribunController.dispose();
    priceVipController.dispose();
    stockVipController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    widget.onSave({
      "title": titleController.text,
      "location": locationController.text,
      "date": dateController.text,
      "time": timeController.text,
      "price_tribun": priceTribunController.text,
      "stock_tribun": stockTribunController.text,
      "price_vip": priceVipController.text,
      "stock_vip": stockVipController.text,
      "banner": widget.match["banner"] ?? "",
      "team1_logo": widget.match["team1_logo"] ?? "",
      "team2_logo": widget.match["team2_logo"] ?? "",
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Pertandingan"),
        backgroundColor: Color(0xFF426BDE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildTextField("Judul", titleController),
              _buildTextField("Lokasi", locationController),
              _buildTextField("Tanggal", dateController),
              _buildTextField("Waktu", timeController),
              _buildTextField("Harga Tribun", priceTribunController),
              _buildTextField("Stok Tribun", stockTribunController),
              _buildTextField("Harga VIP", priceVipController),
              _buildTextField("Stok VIP", stockVipController),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF426BDE),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    "Simpan Perubahan",
                    style: TextStyle(
                      color: Colors.white, 
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
