// ─── Invoice List Item ────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes/model/sales_model.dart';

class InvoiceItemCard extends StatelessWidget {
  final SalesModel invoice;
  const InvoiceItemCard({super.key, required this.invoice});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Invoice No + Customer Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '#',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF7D7D7D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      invoice.invoiceNo!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  invoice.customerName!.isEmpty
                      ? "No Username"
                      : invoice.customerName!,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Right: Status + Amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                invoice.status!,
                style: GoogleFonts.poppins(
                  // color: _statusColor,
                  color: invoice.status == 'Pending'
                      ? Color(0xFFE81C1C)
                      : invoice.status == 'Invoiced'
                      ? Color(0xFF1C60E2)
                      : Color(0xFF7D7D7D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'SAR. ',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF888888),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: invoice.total,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
