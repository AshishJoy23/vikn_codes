import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes/view/invoices_screen.dart';

import '../../controller/api_controller.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isInvoice;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isInvoice,
  });

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(APIController());
    return InkWell(
      onTap: () {
        if (isInvoice) {
          // appController.filteredSalesList.clear();
          // appController.filteredSalesList.value=appController.salesList;
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => InvoicesScreen()));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: Color(0xFF28635B)),
            ),

            const SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Color(0xFF131313),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Icon(
                Icons.arrow_forward,
                size: 24,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}