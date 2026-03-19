import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes/view/login_screen.dart';

String? token;
int? userId;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  userId = prefs.getInt('userId');
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
