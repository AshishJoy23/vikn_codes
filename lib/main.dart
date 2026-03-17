import 'package:flutter/material.dart';
import 'package:vikn_codes/home_screen.dart';
import 'package:vikn_codes/login_screen.dart';

void main() {
  runApp(const CabZingApp());
}

class CabZingApp extends StatelessWidget {
  const CabZingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CabZing",
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}

