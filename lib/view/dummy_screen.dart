import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyScreen extends StatelessWidget {
  final String text;
  const DummyScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // ── Add your notifications screen content here ──
            _PlaceholderCard(label: 'No New $text'),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderCard extends StatelessWidget {
  final String label;
  const _PlaceholderCard({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.poppins(color: Color(0xFFFFFFFF), fontSize: 14),
        ),
      ),
    );
  }
}
