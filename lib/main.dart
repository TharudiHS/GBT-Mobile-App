import 'package:bawatrust_app/screens/loading_page.dart';
import 'package:flutter/material.dart';

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
