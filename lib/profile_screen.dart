import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          _ProfileCard(),
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
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/avatar.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.person, color: Colors.white54, size: 32),
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
                  'David Arnold',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'david012@cabzing',
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
      onTap: () {},
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

// class _MenuDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Divider(color: Color(0xFF2C2C2E), height: 1, thickness: 1);
//   }
// }

//// ─── Bottom Navigation Bar ───────────────────────────────────────────────────

// class _BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(bottom: 16, top: 10),
//       decoration: const BoxDecoration(
//         color: Color(0xFF0D0D0D),
//         border: Border(top: BorderSide(color: Color(0xFF1C1C1E), width: 1)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _NavBarItem(icon: Icons.pentagon_outlined, isActive: false),
//           _NavBarItem(icon: Icons.bookmark_border_rounded, isActive: false),
//           _NavBarItem(icon: Icons.notifications_none_rounded, isActive: false),
//           _NavBarItem(icon: Icons.person_outline_rounded, isActive: true),
//         ],
//       ),
//     );
//   }
// }

// class _NavBarItem extends StatelessWidget {
//   final IconData icon;
//   final bool isActive;

//   const _NavBarItem({required this.icon, required this.isActive});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           icon,
//           color: isActive ? Colors.white : const Color(0xFF636366),
//           size: 26,
//         ),
//         const SizedBox(height: 5),
//         if (isActive)
//           Container(
//             width: 5,
//             height: 5,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//           )
//         else
//           const SizedBox(height: 5),
//       ],
//     );
//   }
// }
