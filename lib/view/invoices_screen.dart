import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes/controller/api_controller.dart';
import 'package:vikn_codes/view/filter_screen.dart';
import 'package:vikn_codes/view/widgets/custom_appbar.dart';
import 'package:vikn_codes/view/widgets/invoice_itemcard.dart';


class InvoicesScreen extends StatelessWidget {
  InvoicesScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  // @override
  @override
  Widget build(BuildContext context) {
    final appController = Get.put(APIController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── App Bar ─────────────────────────────────────────────────
            CustomAppbar(isFilter: false,),

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
                        cursorColor: Color(0xff0A9EF3),
                        onChanged: (val) {
                          appController.getfilteredInvoices(val);
                        },

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
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => FilterScreen()));
                    },
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
              child: Obx(
                () => ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: appController.filteredSalesList.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Color(0xFF1C3347), height: 1),
                  itemBuilder: (context, index) {
                    return InvoiceItemCard(
                      invoice: appController.filteredSalesList[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


