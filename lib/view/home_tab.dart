import 'package:flutter/material.dart';
import 'package:vikn_codes/view/dummy_screen.dart';
import 'package:vikn_codes/view/filter_screen.dart';
import 'package:vikn_codes/view/home_screen.dart';
import 'package:vikn_codes/view/invoices_screen.dart';
import 'package:vikn_codes/view/profile_screen.dart';

// ─── Home Screen (Shell) ──────────────────────────────────────────────────────
// This is the persistent shell that holds the bottom nav and switches screens.
// IndexedStack keeps all screens alive (preserves scroll/state).

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // The four destination screens — swap these with your real screen widgets
  final List<Widget> _screens = [
    HomeScreen(),
    DummyScreen(text: 'Messages'),
    DummyScreen(text: 'Notifications'),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // IndexedStack renders all screens but only shows the selected one.
      // This means each screen retains its scroll position and state.
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// ─── Custom Bottom Nav Bar ────────────────────────────────────────────────────

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, 'assets/home.png'),
          _buildNavItem(1, 'assets/share.png'),
          _buildNavItem(2, 'assets/bell.png'),
          _buildNavItem(3, 'assets/profile.png'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: isSelected ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 6),
          if (isSelected)
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
