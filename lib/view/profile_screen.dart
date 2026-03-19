import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes/controller/api_controller.dart';
import 'package:vikn_codes/model/profile_model.dart';
import 'package:vikn_codes/view/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appController = Get.put(APIController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Container(
                      // color: Color(0xff0F0F0F),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          // Profile Card
                          _ProfileCard(
                            profile: appController.profileData.value,
                          ),
                          const SizedBox(height: 16),

                          // Stats Row
                          _StatsRow(),
                          const SizedBox(height: 16),

                          // Logout Button
                          _LogoutButton(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Menu Items
                    _MenuItem(icon: Icons.help_outline_rounded, label: 'Help'),
                    // _MenuDivider(),
                    _MenuItem(icon: Icons.refresh_rounded, label: 'FAQ'),
                    // _MenuDivider(),
                    _MenuItem(
                      icon: Icons.person_add_alt_outlined,
                      label: 'Invite Friends',
                    ),
                    // _MenuDivider(),
                    _MenuItem(
                      icon: Icons.manage_accounts_outlined,
                      label: 'Terms of service',
                    ),
                    // _MenuDivider(),
                    _MenuItem(
                      icon: Icons.shield_outlined,
                      label: 'Privacy Policy',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // // Bottom Navigation Bar
            // _BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

// ─── Profile Card ────────────────────────────────────────────────────────────

class _ProfileCard extends StatelessWidget {
  final ProfileModel? profile;
  const _ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        // color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                profile!.photo!, // ← your URL here
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: Color(0xff0A9EF3),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    'assets/avatar.png',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.person,
                      color: Colors.white54,
                      size: 32,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Name & Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile!.name!,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  profile!.email!,
                  style: GoogleFonts.poppins(
                    color: Color(0xFFB5CDFE),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Edit Icon
          SizedBox(
            width: 25,
            height: 25,
            child: Image.asset(
              'assets/edit.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.person, color: Colors.white54, size: 32),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Stats Row ───────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Purple pill with stars icon
                Container(
                  width: 40,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB5CDFE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.star_border_rounded,
                    color: Color(0xFF28635B),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '4.3',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 3),
                        Icon(Icons.star_rounded, color: Colors.white, size: 16),
                      ],
                    ),
                    Text(
                      '2,211',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF565656),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'rides',
                      style: GoogleFonts.poppins(
                        color: Color(0xFFB5CDFE),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),

        // KYC Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Purple pill with stars icon
                Container(
                  width: 40,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA9C9C5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.verified_outlined,
                    color: Color(0xFF28635B),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'KYC',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Verified',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF565656),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Logout Button ───────────────────────────────────────────────────────────

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('message');
        _showLogoutDialog(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, color: Color(0xFFEA6262), size: 24),
            SizedBox(width: 8),
            Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: Color(0xFFEA6262),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C1C1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Logout',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // ← closes the dialog
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: Color(0xFF8E8E93),
                  fontSize: 15,
                ),
              ),
            ),

            // Logout Button
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // ← close dialog first
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (route) => false, // ← removes ALL previous screens from stack
                );
              },
              child: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  color: Color(0xFFFF3B30),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Menu Item ───────────────────────────────────────────────────────────────

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFFB5CDFE), size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  color: Color(0xFFF6F6F6),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
