import 'package:flutter/material.dart';
import 'package:kickpass/list/user_details.dart';

class ProfileDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Profil')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildDetailRow(context, 'Nama Pengguna', user.username),
          const SizedBox(height: 16),
          _buildDetailRow(context, 'Nama', user.name),
          const SizedBox(height: 16),
          _buildDetailRow(context, 'Email', user.email),
          const SizedBox(height: 16),
          _buildDetailRow(context, 'Telepon', user.phone),
          const SizedBox(height: 16),
          _buildDetailRow(context, 'Password', user.password),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ubah $label')),
                  );
                },
                child: const Text(
                  'Ubah',
                  style: TextStyle(color: Color(0xFF426BDE)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 2),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
