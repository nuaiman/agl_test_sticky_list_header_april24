import 'package:flutter/material.dart';

import 'view/home_screen.dart';

void main() {
  runApp(const AGLApp());
}

class AGLApp extends StatelessWidget {
  const AGLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGL App',
      home: HomeScreen(),
    );
  }
}
