import 'package:flutter/material.dart';
import 'package:kickpass/screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/transactions_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/buy_ticket_screen.dart';

void main() {
  runApp(TiketCustomApp());
}

class TiketCustomApp extends StatelessWidget {
  const TiketCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiket Custom',
      theme: ThemeData(
        primaryColor: Color(0xFF426BDE),
        hintColor: Colors.lightBlue,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenLoader(),
    );
  }
}

class SplashScreenLoader extends StatefulWidget {
  const SplashScreenLoader({super.key});

  @override
  _SplashScreenLoaderState createState() => _SplashScreenLoaderState();
}

class _SplashScreenLoaderState extends State<SplashScreenLoader> {
  @override
  void initState() {
    super.initState();
    // Navigasikan ke MainScreen setelah beberapa detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BuyTicketScreen(),
    const TransactionsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Color(0xFF426BDE),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Beli Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Tiket Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil Saya',
          ),
        ],
      ),
    );
  }
}
