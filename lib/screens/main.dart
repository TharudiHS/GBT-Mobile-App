import 'package:flutter/material.dart';
import 'loading_page.dart';

void main() {
  runApp(const BawaTrustApp());
}

class BawaTrustApp extends StatelessWidget {
  const BawaTrustApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geoffrey Bawa Trust',
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
    );
  }
}
