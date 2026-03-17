import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              // const SizedBox(height: 10),

              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/appbar_logo.png', // your CabZing logo
                    height: 30,
                    fit: BoxFit.fill,
                  ),

                  Spacer(),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/avatar.png"),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Revenue Card
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xff0E0E0E),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'SAR ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w100,
                            ),
                            children: [
                              TextSpan(
                                text: ' 2,78,000.00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          "Revenue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // const TextSpan(
                    //   text: "+21% than last month",
                    //   children: [],
                    //   style: TextStyle(color: Colors.green),
                    // ),
                    RichText(
                      text: TextSpan(
                        text: '+21% ',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'than last month',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: LineChart(
                        LineChartData(
                          minX: -1,
                          maxX: 9,
                          minY: 0,
                          maxY: 4.5,

                          /// GRID LINES
                          gridData: FlGridData(
                            show: true,
                            horizontalInterval: 1,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.blueGrey.withValues(alpha: 0.3),
                                strokeWidth: 1,
                              );
                            },
                          ),

                          /// AXIS TITLES
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                reservedSize: 15,
                                getTitlesWidget: (value, meta) {
                                  String text = "";
                                  switch (value) {
                                    case 0:
                                      return const Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      );
                                    case 1:
                                      return SizedBox(
                                        width: 20,
                                        child: const Text(
                                          "1K",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    case 2:
                                      return const Text(
                                        "2K",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      );
                                    case 3:
                                      return const Text(
                                        "3K",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      );
                                    case 4:
                                      return const Text(
                                        "4K",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      );
                                  }
                                  return SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    space: 6,
                                    child: Text(
                                      text,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),

                          borderData: FlBorderData(
                            show: true,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.blueGrey.withValues(alpha: 0.35),
                                width: 1,
                              ),
                            ),
                          ),

                          /// VERTICAL INDICATOR LINE
                          extraLinesData: ExtraLinesData(
                            verticalLines: [
                              VerticalLine(
                                x: 3,
                                color: Colors.white54,
                                strokeWidth: 1,

                                label: VerticalLineLabel(
                                  show: true,
                                  alignment: Alignment(0, -1.25),
                                  // padding: const EdgeInsets.only(top: 0),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelResolver: (line) {
                                    return "SAR 3945.00";
                                  },
                                ),
                              ),
                            ],
                          ),

                          /// CHART LINE
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              color: Colors.cyan,
                              barWidth: 2,

                              dotData: const FlDotData(show: false),

                              spots: const [
                                FlSpot(0, 0.2),
                                FlSpot(1, 2.4),
                                FlSpot(2, 2.1),
                                FlSpot(3, 3.9),
                                FlSpot(4, 2.6),
                                FlSpot(5, 3.2),
                                FlSpot(6, 2.0),
                                FlSpot(7, 2.4),
                                FlSpot(8, 1.7),
                                FlSpot(9, 2.5),
                              ],

                              /// GRADIENT AREA
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.cyan.withValues(alpha: 0.8),
                                    // Colors.cyan.withValues(alpha: 0.3),
                                    Colors.cyan.withValues(alpha: 0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],

                          lineTouchData: LineTouchData(enabled: false),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Center(
                      child: Text(
                        "September 2023",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(8, (index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: index == 1 ? Colors.blue : Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "0${index + 1}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Bookings Card
              const InfoCard(
                title: "Bookings",
                value: "123",
                subtitle: "Reserved",
                icon: Icons.pie_chart_outline,
                color: Colors.grey,
              ),

              const SizedBox(height: 15),

              /// Invoices Card
              const InfoCard(
                title: "Invoices",
                value: "10,232.00",
                subtitle: "Rupees",
                icon: Icons.person_outline,
                color: Colors.teal,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xff0E0E0E),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 70,
            decoration: BoxDecoration(
              color: color.withOpacity(.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),

          const Spacer(),

          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.navigation), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
    );
  }
}

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
      height: 80,
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
