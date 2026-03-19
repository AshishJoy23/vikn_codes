// import 'dart:math';
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes/constants/messages.dart';
import 'package:vikn_codes/controller/api_controller.dart';
import 'package:vikn_codes/view/home_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(APIController());
    return Scaffold(
      // backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          /// 🔥 Animated Background
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: BackgroundPainter(_controller.value),
                child: Container(),
              );
            },
          ),

          /// 🔥 UI Content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: MediaQuery.of(
                  context,
                ).viewInsets.bottom, // 🔥 IMPORTANT
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.translate,
                        color: const Color(0xff0A9EF3),
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "English",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                  /// Title
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Login to your vikn account",
                    style: GoogleFonts.poppins(
                      color: Color(0xff838383),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 30),

                  /// Glass Card
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff08131E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff1C3347)),
                    ),
                    child: Column(
                      children: [
                        /// Username
                        _buildField(
                          icon: Icons.person_outline,
                          hint: "Username",
                          controller: nameController,
                        ),

                        Divider(
                          color: Color(0xff1C3347),
                          height: 1,
                          thickness: 1,
                        ),

                        /// Password
                        _buildField(
                          icon: Icons.key_outlined,
                          hint: "Password",
                          controller: passwordController,
                          obscure: obscure,
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: Icon(
                              obscure ? Icons.visibility_off : Icons.visibility,
                              color: Color(0xff0A9EF3),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  /// Forgot Password
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Forgotten Password?",
                      style: GoogleFonts.poppins(
                        color: Color(0xff0A9EF3),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  /// Sign In Button
                  InkWell(
                    onTap: () async {
                      if (nameController.text.trim().isEmpty ||
                          passwordController.text.trim().isEmpty) {
                        showSnackbarMsg(context, 'Enter Login Credentials');
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Center(
                              child: SpinKitChasingDots(
                                color: Color(0xff0A9EF3),
                              ),
                            );
                          },
                        );
                        await appController.getLoginCredential(
                          nameController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (appController.isVerified.value) {
                          await appController.getProfileData();
                          await appController.getAllSalesList();
                          Navigator.of(context).pop();
                          showSnackbarMsg(context, 'Login successfully');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => HomeTab()),
                          );
                        } else {
                          Navigator.of(context).pop();
                          showSnackbarMsg(context, 'Invalid User');
                        }
                      }
                    },
                    child: Container(
                      width: 125,
                      height: 48,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff0E75F4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Sign in",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.16),

                  /// Bottom Text
                  Column(
                    children: [
                      Text(
                        "Don’t have an Account?",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Sign up now!",
                        style: GoogleFonts.poppins(
                          color: Color(0xff0A9EF3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    bool obscure = false,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xff0A9EF3), size: 24),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hint,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Color(0xff7D7D7D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // SizedBox(height: 2),
                TextField(
                  controller: controller,
                  obscureText: obscure,
                  style: GoogleFonts.poppins(
                    color: Color(0xffFFFFFF),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: Color(0xff0A9EF3),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    // hintText: hint,
                    // hintStyle: TextStyle(color: Colors.white38),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double value;

  BackgroundPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    void drawMovingCircle({
      required Color color,
      required double progress,
      required Offset start,
      required Offset end,
      required double radius,
    }) {
      // Interpolate position
      final dx = start.dx + (end.dx - start.dx) * progress;
      final dy = start.dy + (end.dy - start.dy) * progress;

      paint.shader = RadialGradient(
        colors: [color.withValues(alpha: 0.3), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromCircle(center: Offset(dx, dy), radius: radius));

      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }

    /// 🔥 Moving lights (different directions)

    // Blue light → Left to Right
    drawMovingCircle(
      color: Colors.blue,
      progress: value,
      start: Offset(0, size.height * 0.2),
      end: Offset(size.width, size.height * 0.4),
      radius: 200,
    );

    // Purple light → Bottom to Top
    drawMovingCircle(
      color: Colors.purple,
      progress: value,
      start: Offset(size.width * 0.5, size.height),
      end: Offset(size.width * 0.8, 0),
      radius: 250,
    );

    // Yellow light → Diagonal movement
    drawMovingCircle(
      color: Colors.yellow,
      progress: value,
      start: Offset(size.width * 0.9, size.height * 0.8),
      end: Offset(size.width * 0.1, size.height * 0.2),
      radius: 180,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
