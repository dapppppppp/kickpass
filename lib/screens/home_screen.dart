import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kickpass/list/ticket_list.dart';
import 'package:kickpass/screens/match_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Logo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              color: Color(0xFF426BDE),
              child: Center(
                child: Image.asset(
                  'assets/images/Logo2.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
              ),
              items: ticketList.map((ticket) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector( // Membuat banner dapat diklik
                      onTap: () {
                        // Navigasi ke halaman MatchDetailsScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchDetailsScreen(
                              match: ticket, // Mengirim data pertandingan
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(ticket["banner"] ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Section Title
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Pertandingan Terbaru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF426BDE),
                ),
              ),
            ),

            // GridView Pertandingan
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              itemCount: ticketList.length, // Jumlah pertandingan
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                final ticket = ticketList[index];

                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman MatchDetailsScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchDetailsScreen(
                          match: ticket,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [Colors.blueGrey, Color(0xFF426BDE)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Banner Image
                          Container(
                            width: double.infinity,
                            height: 270.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(ticket["banner"] ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),

                          // Match Title
                          Text(
                            ticket["title"] ?? 'Pertandingan ${index + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
