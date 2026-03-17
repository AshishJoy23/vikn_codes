// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  /// Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.translate, color: const Color(0xff0A9EF3)),
                      SizedBox(width: 6),
                      Text(
                        "English",
                        style: GoogleFonts.poppins(color: Colors.white70),
                      ),
                    ],
                  ),

                  Spacer(),

                  /// Title
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Login to your vikn account",
                    style: GoogleFonts.poppins(color: Colors.white54),
                  ),

                  SizedBox(height: 30),

                  /// Glass Card
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff08131E),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xff1C3347)),
                    ),
                    child: Column(
                      children: [
                        /// Username
                        _buildField(
                          icon: Icons.person_outline,
                          hint: "Username",
                          value: "Savadfarooque",
                        ),

                        Divider(color: Color(0xff1C3347), height: 1),

                        /// Password
                        _buildField(
                          icon: Icons.key_outlined,
                          hint: "Password",
                          obscure: obscure,
                          trailing: IconButton(
                            icon: Icon(
                              obscure ? Icons.visibility_off : Icons.visibility,
                              color: Color(0xff0A9EF3),
                            ),
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
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
                      style: GoogleFonts.poppins(color: Color(0xff0A9EF3)),
                    ),
                  ),

                  SizedBox(height: 30),

                  /// Sign In Button
                  Container(
                    width: 130,
                    height: 50,
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
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),

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
    String? value,
    bool obscure = false,
    Widget? trailing,
  }) {
    return Row(
      children: [
        Icon(icon, color: Color(0xff0A9EF3)),
        SizedBox(width: 12),
        Expanded(
          child: TextField(
            obscureText: obscure,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white38),
              border: InputBorder.none,
            ),
          ),
        ),
        if (trailing != null) trailing,
      ],
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
        colors: [
          color.withValues(alpha: 0.3),
          color.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(dx, dy),
        radius: radius,
      ));

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