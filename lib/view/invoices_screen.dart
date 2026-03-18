import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum InvoiceStatus { pending, invoiced, cancelled }

class Invoice {
  final String invoiceNo;
  final String customerName;
  final double amount;
  final InvoiceStatus status;

  const Invoice({
    required this.invoiceNo,
    required this.customerName,
    required this.amount,
    required this.status,
  });
}

// ─── Screen ───────────────────────────────────────────────────────────────────

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Invoice> _allInvoices = const [
    Invoice(
      invoiceNo: 'Invoice No',
      customerName: 'Customer Name',
      amount: 10000.00,
      status: InvoiceStatus.pending,
    ),
    Invoice(
      invoiceNo: 'Invoice No',
      customerName: 'Customer1 Name',
      amount: 10000.00,
      status: InvoiceStatus.invoiced,
    ),
    Invoice(
      invoiceNo: 'Invoice No',
      customerName: 'Customer Name',
      amount: 10000.00,
      status: InvoiceStatus.cancelled,
    ),
    Invoice(
      invoiceNo: 'Invoice No',
      customerName: 'Customer Name',
      amount: 10000.00,
      status: InvoiceStatus.pending,
    ),
  ];

  List<Invoice> get _filteredInvoices {
    if (_searchQuery.isEmpty) return _allInvoices;
    final q = _searchQuery.toLowerCase();
    return _allInvoices
        .where(
          (inv) =>
              inv.invoiceNo.toLowerCase().contains(q) ||
              inv.customerName.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── App Bar ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
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
                ],
              ),
            ),

            const Divider(color: Color(0xFF1C3347), height: 1),

            // ── Search + Filter Row ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFF08131E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF1C3347)),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (val) => setState(() => _searchQuery = val),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: GoogleFonts.poppins(
                            color: Color(0xFF8A8A8A),
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset(
                              'assets/search.png',
                              fit: BoxFit.cover,
                              width: 20,
                              height: 20,
                              color: Color(0xFF8A8A8A),
                              errorBuilder: (_, __, ___) => const Icon(
                                CupertinoIcons.search,
                                color: Colors.white54,
                                size: 20,
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Add Filters Button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/filter.png',
                              fit: BoxFit.cover,
                              color: Color(0xFF0E74F4),
                              errorBuilder: (_, __, ___) => const Icon(
                               Icons.tune_rounded,
                                color: Colors.white54,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Add Filters',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF1C3347), height: 1),
            const SizedBox(height: 4),

            // ── Invoice List ────────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filteredInvoices.length,
                separatorBuilder: (_, __) =>
                    const Divider(color: Color(0xFF1C3347), height: 1),
                itemBuilder: (context, index) {
                  return _InvoiceItem(invoice: _filteredInvoices[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Invoice List Item ────────────────────────────────────────────────────────

class _InvoiceItem extends StatelessWidget {
  final Invoice invoice;
  const _InvoiceItem({required this.invoice});

  Color get _statusColor {
    switch (invoice.status) {
      case InvoiceStatus.pending:
        return const Color(0xFFE81C1C);
      case InvoiceStatus.invoiced:
        return const Color(0xFF1C60E2);
      case InvoiceStatus.cancelled:
        return const Color(0xFF7D7D7D);
    }
  }

  String get _statusLabel {
    switch (invoice.status) {
      case InvoiceStatus.pending:
        return 'Pending';
      case InvoiceStatus.invoiced:
        return 'Invoiced';
      case InvoiceStatus.cancelled:
        return 'Cancelled';
    }
  }

  String _formatAmount(double amount) {
    // Format with comma separator
    final parts = amount.toStringAsFixed(2).split('.');
    final intPart = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (m) => '${m[1]},',
    );
    return '$intPart.${parts[1]}';
  }

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
                      invoice.invoiceNo,
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
                  invoice.customerName,
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
                _statusLabel,
                style: GoogleFonts.poppins(
                  color: _statusColor,
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
                      text: _formatAmount(invoice.amount),
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
