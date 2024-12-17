import 'package:flutter/material.dart';
import 'package:kickpass/Auth/Register_screen.dart';
import 'package:kickpass/gatekeeper/scan_screen.dart';
import 'package:kickpass/list/gatekeeper_details.dart';
import 'package:kickpass/list/user_details.dart';
import 'package:kickpass/main.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool _obscurePassword = true;

  // Fungsi untuk memeriksa login
  String? checkLogin(String username, String password) {
    // return username == gatekeeper.username && password == gatekeeper.password;
    if (username == gatekeeper.username && password == gatekeeper.password){
      return gatekeeper.role;
    }
    else if (username == user.username && password == user.password){
      return user.role;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo di tengah
            Image.asset(
              'assets/images/Logo.png',
              height: 200,
            ),
            const SizedBox(height: 40),

            // Form Login
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username Input
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF426BDE), width: 2),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                    style: TextStyle(fontSize: 15),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Input
                  TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF426BDE), width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                    style: TextStyle(fontSize: 15),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        String? role = checkLogin(username, password);
                        // Cek login dengan username dan password
                        if (role != null) {
                          // Jika login berhasil
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login Successful')));
                          // Navigasi ke halaman Beranda Penjaga
                          if (role == 'user') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MainScreen()),
                            );
                          } else if (role == 'gatekeeper') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ScanPage()),
                            );
                          }
                        } else {
                          // Jika login gagal
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Invalid username or password')));
                        }
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF426BDE),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),

            // Daftar
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Arahkan ke halaman register
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tidak punya akun? ',
                        style: TextStyle(fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF426BDE),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
