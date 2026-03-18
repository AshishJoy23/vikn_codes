import 'package:flutter/material.dart';

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
      customerName: 'Customer Name',
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
        .where((inv) =>
            inv.invoiceNo.toLowerCase().contains(q) ||
            inv.customerName.toLowerCase().contains(q))
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 22),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Invoices',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
 
            // ── Search + Filter Row ─────────────────────────────────────
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (val) =>
                            setState(() => _searchQuery = val),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Color(0xFF8E8E93), fontSize: 14),
                          prefixIcon: Icon(Icons.search_rounded,
                              color: Color(0xFF8E8E93), size: 20),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 13),
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
                        color: const Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.tune_rounded,
                              color: Color(0xFF2979FF), size: 18),
                          SizedBox(width: 6),
                          Text(
                            'Add Filters',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
 
            const SizedBox(height: 4),
 
            // ── Invoice List ────────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filteredInvoices.length,
                separatorBuilder: (_, __) => const Divider(
                  color: Color(0xFF1C1C1E),
                  height: 1,
                ),
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
        return const Color(0xFFFF3B30);
      case InvoiceStatus.invoiced:
        return const Color(0xFF2979FF);
      case InvoiceStatus.cancelled:
        return const Color(0xFF8E8E93);
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
                    const Text(
                      '#',
                      style: TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      invoice.invoiceNo,
                      style: const TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  invoice.customerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
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
                style: TextStyle(
                  color: _statusColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'SAR. ',
                      style: TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: _formatAmount(invoice.amount),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
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