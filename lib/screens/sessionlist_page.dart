import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:bawatrust_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'sidebar_page.dart';
import 'ticketscan_page.dart';

class SessionListPage extends StatefulWidget {
  const SessionListPage({super.key});

  @override
  State<SessionListPage> createState() => _SessionListPageState();
}

class _SessionListPageState extends State<SessionListPage> {
  int? selectedIndex;

  final List<Map<String, String>> sessions = [
    {
      'image': 'assets/images/session1.jpeg',
      'title': 'Lunuganga Garden, Bentota',
      'date': 'March 23, 2024',
      'time': '11.00 AM',
    },
    {
      'image': 'assets/images/session2.jpeg',
      'title': 'Lunuganga Garden, Bentota',
      'date': 'March 23, 2024',
      'time': '2.00 PM',
    },
    {
      'image': 'assets/images/session3.jpeg',
      'title': 'Lunuganga Garden, Bentota',
      'date': 'March 23, 2024',
      'time': '3.00 PM',
    },
    {
      'image': 'assets/images/session4.jpg',
      'title': 'Number 11, Colombo 03',
      'date': 'January 23, 2023',
      'time': '6.30 PM',
    },
    {
      'image': 'assets/images/session4.jpg',
      'title': 'Number 11, Colombo 03',
      'date': 'January 23, 2023',
      'time': '6.30 PM',
    },
    {
      'image': 'assets/images/session4.jpg',
      'title': 'Number 11, Colombo 03',
      'date': 'January 23, 2023',
      'time': '6.30 PM',
    },
  ];

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
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColours.black,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/session_icon.jpg',
                  height: 28,
                  width: 28,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Session List',
                  style: TextStyles.size22WeightBoldTTCommonsRegular,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                final isSelected = selectedIndex == index;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketScanPage(
                          title: session['title']!,
                          date: session['date']!,
                          time: session['time']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: isSelected ? AppColours.gold40 : AppColours.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: _buildSessionCard(
                      context,
                      imagePath: session['image']!,
                      title: session['title']!,
                      date: session['date']!,
                      time: session['time']!,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String date,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.7),
          child: Image.asset(
            imagePath,
            width: 117.3,
            height: 162.7,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.size16WeightBoldTTCommonsRegular),
                const SizedBox(height: 9),
                Text(date, style: TextStyles.size12TTCommonsRegular),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColours.gold,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    time,
                    style: TextStyles.size12WeightBoldTTCommonsRegular,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Icon(Icons.chevron_right, color: AppColours.black, size: 30),
        ),
      ],
    );
  }
}
