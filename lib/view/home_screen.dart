import 'package:flutter/material.dart';
import 'package:vikn_codes/view/widgets/home_infocard.dart';
import 'package:vikn_codes/view/widgets/revenue_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            RevenueChart(),

            const SizedBox(height: 25),

            /// Bookings Card
            const InfoCard(
              title: "Bookings",
              value: "123",
              subtitle: "Reserved",
              icon: Icons.pie_chart_outline,
              color: Color(0xFFF6EFED),
              isInvoice: false,
            ),

            const SizedBox(height: 15),

            /// Invoices Card
            const InfoCard(
              title: "Invoices",
              value: "10,232.00",
              subtitle: "Rupees",
              icon: Icons.person_outline,
              color: Color(0xFFA9C9C5),
              isInvoice: true,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




