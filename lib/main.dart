import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const FlomartApp());
}

class FlomartApp extends StatelessWidget {
  const FlomartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flomart',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7F1),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B8F55)),
      ),
      home: const HomePage(),
    );
  }
}
