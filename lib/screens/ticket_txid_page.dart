import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:bawatrust_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'ticketscan_page.dart';
import 'ticket_summary_page.dart';
import 'sidebar_page.dart';
import 'ticket_count_popup.dart';

class TicketTxIdPage extends StatefulWidget {
  final String title;
  final String date;
  final String time;

  const TicketTxIdPage({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  State<TicketTxIdPage> createState() => _TicketTxIdPageState();
}

class _TicketTxIdPageState extends State<TicketTxIdPage> {
  int _selectedIndex = 1;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TicketScanPage(
            title: widget.title,
            date: widget.date,
            time: widget.time,
          ),
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
      backgroundColor: Colors.white,
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
                        style: TextStyles.size17WeightBoldTTCommonsRegular,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        widget.date,
                        style: TextStyles.size12TTCommonsRegularwhite,
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
                    style: TextStyles.size14TTCommonsRegular,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 178),

          // Reference ID Input Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter a Reference ID',
                  style: TextStyles.size30CormorantGaramondBoldblack,
                ),
                SizedBox(height: 6),
                // Golden line
                SizedBox(
                  height: 1,
                  width: 343,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: AppColours.gold),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColours.greyF2,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'XXXX XXXX XXXX XXXX XXXX',
                      hintStyle: TextStyle(
                        fontFamily: 'TT Commons Italic',
                        fontSize: 12,
                        color: AppColours.greyB5,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.gold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: AppColours.black.withOpacity(0.5),
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.zero,
                          child: TicketPopup(
                            title: widget.title,
                            date: widget.date,
                            time: widget.time,
                            availableCount: 10,
                            referenceNo: '462800237W23016',
                            onRedeem: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      'Verify',
                      style: TextStyles.size16TTCommonsRegularwhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
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
            Text(label, style: TextStyles.size15TCommonsRegular),
          ],
        ),
      ),
    );
  }
}
