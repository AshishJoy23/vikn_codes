import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
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
                  style: GoogleFonts.poppins(
                    color: Color(0xFF929292),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: '2,78,000.00',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
    
              Text(
                "Revenue",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
    
          const SizedBox(height: 5),
    
          RichText(
            text: TextSpan(
              text: '+21% ',
              style: GoogleFonts.poppins(
                color: Color(0xFF199E56),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: 'than last month',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
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
                minX: -0.5,
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
                      reservedSize: 18,
                      getTitlesWidget: (value, meta) {
                        String text = "";
                        switch (value) {
                          case 0:
                            return Text(
                              "0",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            );
                          case 1:
                            return SizedBox(
                              width: 20,
                              child: Text(
                                "1K",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          case 2:
                            return Text(
                              "2K",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            );
                          case 3:
                            return Text(
                              "3K",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            );
                          case 4:
                            return Text(
                              "4K",
                              style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
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
                      color: Color(0xFFE3E3E3),
                      strokeWidth: 1,
    
                      label: VerticalLineLabel(
                        show: true,
                        alignment: Alignment(0, -1.25),
                        // padding: const EdgeInsets.only(top: 0),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
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
                    color: Color(0xFF0A9BC9),
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
                          Color(0xFF007FA7),
                          Color(0xFF000000),
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
    
          Center(
            child: Text(
              "September 2023",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
    
          const SizedBox(height: 15),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(8, (index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: index == 1
                      ? Color(0xFF2489E7)
                      : Color(0xFF131313),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "0${index + 1}",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}