import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:bawatrust_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'sidebar_page.dart';
import 'account_personal_info_page.dart';
import 'change_password_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

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
                        border: Border.all(color: AppColours.white, width: 1.5),
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
                  style: TextStyles.size16WeightBoldTTCommonsMedium,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Personal Information Section ---
                _buildSectionTitle(
                  "Personal Information",
                  onEditTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AccountPersonalInfoPage(),
                      ),
                    );
                  },
                ),
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
                _buildInfoRow("User Venues:", "No Venues Assigned"),
                const SizedBox(height: 20),
                const Divider(color: AppColours.black),
                // --- Password Section ---
                const SizedBox(height: 30),
                _buildSectionTitle(
                  "Password",
                  onEditTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ChangePasswordPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 45),
                _buildInfoRow("Password:", "**********"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onEditTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.size22WeightBoldCormorantGaramondBoldblack,
        ),
        InkWell(
          onTap: onEditTap,
          child: const Icon(Icons.edit, size: 20, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {String? badge}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyles.size13WeightBoldTTCommonsMedium,
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(value, style: TextStyles.size13WeightBoldTTCommonsRegular),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColours.yellowAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      badge,
                      style: TextStyles.size10WeightBoldTTCommonsMedium,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//  Custom Oval Ring Painter for person icon
class OvalRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColours.white
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
