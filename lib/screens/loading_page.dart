import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:bawatrust_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Make sure this import is correct

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    // Delay 3 seconds then navigate to LoginPage
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColours.gold,
      body: Stack(
        children: [
          // Logo
          Positioned(
            top: screenHeight * 0.41,
            left: screenWidth * 0.283,
            child: Image.asset(
              'assets/images/gbt_logo_white.png',
              width: screenWidth * 0.424,
              height: screenHeight * 0.118,
              fit: BoxFit.contain,
            ),
          ),
          // Bottom Text
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 340),
              child: Text(
                'GEOFFREY BAWA TRUST',
                style: TextStyles.size24WeightBoldCormorantGaramondBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
