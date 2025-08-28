import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:flutter/material.dart';
import 'ticket_txid_page.dart';
import 'ticket_summary_page.dart';
import 'sidebar_page.dart';

class TicketScanPage extends StatefulWidget {
  final String title;
  final String date;
  final String time;

  const TicketScanPage({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  State<TicketScanPage> createState() => _TicketScanPageState();
}

class _TicketScanPageState extends State<TicketScanPage> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TicketTxIdPage(
            title: widget.title,
            date: widget.date,
            time: widget.time,
          ), // assuming it’s a StatelessWidget
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TicketSummaryPage(
            title: widget.title,
            date: widget.date,
            time: widget.time,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarPage(),
      backgroundColor: AppColours.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: Container(
          color: AppColours.gold,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: AppColours.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Image.asset('assets/images/gbt_logo_white.png', height: 40),
                const Icon(Icons.sync, color: AppColours.white),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Session Info Card
          Container(
            width: double.infinity,
            color: AppColours.black,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/session1.jpeg',
                  width: 60,
                  height: 79,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontFamily: 'TT Commons Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: AppColours.white,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        widget.date,
                        style: const TextStyle(
                          fontFamily: 'TT Commons Regular',
                          fontSize: 12,
                          color: AppColours.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColours.gold,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    widget.time,
                    style: const TextStyle(
                      fontFamily: 'TT Commons Regular',
                      fontSize: 14,
                      color: AppColours.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // QR Image with green overlay and "SCAN ME"
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // QR scan image in back
                  Image.asset(
                    'assets/images/scan_qr.jpg',
                    width: 450,
                    height: 563,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top:
                        100, // Adjust based on where you want to place it over the image
                    child: Container(
                      width: 309,
                      height: 309,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 8),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.rotate(
                          angle:
                              353 *
                              3.1415926535 /
                              180, // 353 degrees in radians
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'SCAN ME',
                              style: TextStyle(
                                fontFamily: 'Cormorant Garamond',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: AppColours.white,
                                shadows: [
                                  Shadow(
                                    color: AppColours.black,
                                    offset: Offset(0, 1),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Nav Bar
      bottomNavigationBar: Container(
        color: AppColours.black,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(0, Icons.qr_code, "QR", AppColours.gold),
            _buildNavButton(1, Icons.text_snippet, "TX ID", AppColours.gold),
            _buildNavButton(2, Icons.article, "Summary", AppColours.gold),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    int index,
    IconData icon,
    String label,
    Color goldColor,
  ) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? goldColor : Colors.transparent,
          border: Border.all(color: AppColours.white),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColours.white, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'TT Commons Regular',
                fontSize: 15,
                color: AppColours.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
