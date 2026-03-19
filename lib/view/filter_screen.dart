import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes/view/widgets/chips_widget.dart';
import 'package:vikn_codes/view/widgets/custom_appbar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedPeriod = 'This Month';
  String _selectedStatus = 'Pending';
  String _selectedCustomer = 'Customer';
  final List<String> _selectedTags = ['savad farooque', 'Ashish'];

  final List<String> _statusOptions = ['Pending', 'Invoiced', 'Cancelled'];
  final List<String> _periodOptions = [
    'This Month',
    'Last Month',
    'This Week',
    'Custom',
  ];
  final List<String> _userOptions = ['Customer', 'Retailer', 'Supplier'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── App Bar ──────────────────────────────────────────────────
            CustomAppbar(isFilter: true),

            const Divider(color: Color(0xFF1C3347), height: 1),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Period Dropdown ───────────────────────────────────
                    Center(
                      child: GestureDetector(
                        onTap: () => _showPeriodPicker(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF08131E),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _selectedPeriod,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── Date Range Row ────────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DateChip(date: '12/09/2023'),
                        const SizedBox(width: 15),
                        DateChip(date: '12/09/2023'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFF1C3347), height: 1),
                    const SizedBox(height: 20),

                    // ── Status Chips ──────────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _statusOptions
                          .map(
                            (status) => GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedStatus = status),
                              child: StatusChip(
                                label: status,
                                isSelected: _selectedStatus == status,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),

                    // ── Customer Dropdown ─────────────────────────────────
                    GestureDetector(
                      onTap: () {
                        _showUserPicker(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF08131E),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF1C3347)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              _selectedCustomer,
                              style: GoogleFonts.poppins(
                                color: Color(0xFFAEAEAE),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Divider(color: Color(0xFF1C3347), height: 1),
                    const SizedBox(height: 20),

                    // ── Selected Tags ─────────────────────────────────────
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _selectedTags
                          .map(
                            (tag) => TagChip(
                              label: tag,
                              onRemove: () =>
                                  setState(() => _selectedTags.remove(tag)),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPeriodPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          ..._periodOptions.map(
            (option) => ListTile(
              title: Text(
                option,
                style: GoogleFonts.poppins(
                  color: _selectedPeriod == option
                      ? const Color(0xff0A9EF3)
                      : Colors.white,
                  fontWeight: _selectedPeriod == option
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              trailing: _selectedPeriod == option
                  ? const Icon(Icons.check, color: Color(0xff0A9EF3), size: 18)
                  : null,
              onTap: () {
                setState(() => _selectedPeriod = option);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showUserPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          ..._userOptions.map(
            (option) => ListTile(
              title: Text(
                option,
                style: GoogleFonts.poppins(
                  color: _selectedCustomer == option
                      ? const Color(0xff0A9EF3)
                      : Colors.white,
                  fontWeight: _selectedCustomer == option
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              trailing: _selectedCustomer == option
                  ? const Icon(Icons.check, color: Color(0xff0A9EF3), size: 18)
                  : null,
              onTap: () {
                setState(() => _selectedCustomer = option);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
