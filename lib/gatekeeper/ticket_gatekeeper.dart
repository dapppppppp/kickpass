import 'package:flutter/material.dart';
import 'package:kickpass/gatekeeper/profile_gatekeeper.dart';
import 'package:kickpass/list/ticket_list.dart';
import 'package:kickpass/gatekeeper/EditTicketScreen.dart';
import 'CustomNavBar.dart';
import 'scan_screen.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  List<Map<String, String>> filteredMatches = [];
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    filteredMatches = ticketList;
  }

  void _filterMatches(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMatches = ticketList;
      } else {
        filteredMatches = ticketList
            .where((match) =>
                match["title"]!.toLowerCase().contains(query.toLowerCase()) ||
                match["location"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToEditScreen(
      BuildContext context, Map<String, String> match, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTicketScreen(
          match: match,
          onSave: (updatedMatch) {
            setState(() {
              ticketList[index] = updatedMatch;
              filteredMatches = List.from(ticketList);
            });
          },
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScanPage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreenGK()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Ticket')),
      body: Column(
        children: [
          // Daftar tiket
          Expanded(
            child: ListView.builder(
              itemCount: filteredMatches.length,
              itemBuilder: (context, index) {
                final match = filteredMatches[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          match["location"] ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                match["title"]?.split(" vs ")[0] ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Text(
                              "VS",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                match["title"]?.split(" vs ")[1] ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tanggal: ${match["date"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Waktu: ${match["time"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _navigateToEditScreen(context, match, index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
