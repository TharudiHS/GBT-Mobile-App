import 'package:bawatrust_app/screens/my_account_page.dart';
import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:bawatrust_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'sidebar_page.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
            color: AppColours.black,
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
                _buildSectionTitle("Change Password"),
                const SizedBox(height: 55),
                _buildPasswordField("New Password*", _newPasswordController),
                const SizedBox(height: 40),
                _buildPasswordField(
                  "Confirm Password*",
                  _confirmPasswordController,
                ),
                const SizedBox(height: 235),
                Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColours.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyles.size15WeightBoldTTCommonsMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Save Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyAccountPage(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColours.gold,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyles.size15WeightBoldTTCommonsMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.size24WeightBoldCormorantGaramondBoldblack,
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.size16WeightBoldTTCommonsMediumblack),
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColours.greyF2,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            hintText: '**********',
            hintStyle: TextStyles.size12TTCommonsItalic,
          ),
          style: TextStyles.size13WeightBoldTTCommonsRegular,
        ),
      ],
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
