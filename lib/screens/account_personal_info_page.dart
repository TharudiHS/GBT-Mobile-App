import 'package:flutter/material.dart';
import 'sidebar_page.dart';

class AccountPersonalInfoPage extends StatelessWidget {
  const AccountPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarPage(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: Container(
          color: const Color(0xFFAC9A58),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
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
      body: ListView(
        children: [
          // custom person icon
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 11,
                      height: 11,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                    Positioned(
                      top: 13,
                      left: -3,
                      child: CustomPaint(
                        size: const Size(17.5, 7),
                        painter: OvalRingPainter(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 28), // reduced spacing from 10 to 6
                const Text(
                  "My Account",
                  style: TextStyle(
                    fontFamily: 'TT Commons Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Personal Information Section ---
                _buildSectionTitle("Personal Information", onEditTap: () {}),
                const SizedBox(height: 40),
                _buildInfoRow(
                  "Name:",
                  "Nirosha Kodithuwakku",
                  badge: "Super Admin",
                ),
                const SizedBox(height: 20),
                _buildInfoRow("Email:", "nirosha@gmail.com"),
                const SizedBox(height: 20),
                _buildInfoRow("User Group:", "Super Admin"),
                const SizedBox(height: 20),
                _buildLabel("User Venues:"),
                const SizedBox(height: 10),
                _buildVenueCard("Lunuganga Garden, Bentota"),
                const SizedBox(height: 10),
                _buildVenueCard("Number 11, Colombo 03"),
                const SizedBox(height: 20),
                const Divider(color: Colors.black), // same as #0000001C
                // --- Password Section ---
                const SizedBox(height: 30),
                _buildSectionTitle("Password", onEditTap: () {}),
                const SizedBox(height: 45),
                _buildInfoRow("Password:", "**********"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    String title, {
    required Null Function() onEditTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'CormorantGaramond-Bold',
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.edit, size: 20, color: Colors.black),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {String? badge}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'TT Commons Medium',
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'TT Commons Regular',
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 193, 5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      fontFamily: 'TT Commons Medium',
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'TT Commons Medium',
        fontSize: 13,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildVenueCard(String venueName) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        venueName,
        style: const TextStyle(
          fontFamily: 'TT Commons Regular',
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//  Custom Oval Ring Painter for person icon
class OvalRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
