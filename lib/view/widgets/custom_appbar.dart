
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  final bool isFilter;
  const CustomAppbar({super.key, required this.isFilter});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Invoices',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            if (isFilter) ...[
              SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(
                  'assets/eye.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xFF0E74F4),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 20),

              Text(
                'Filter',
                style: GoogleFonts.poppins(
                  color: Color(0xFF0A9EF3),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
