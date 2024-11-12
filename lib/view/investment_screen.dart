import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../controller/statistics_controller.dart';


class InvestmentScreen extends StatefulWidget {
  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  final StatisticsController controller = StatisticsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1A43),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B1A43),
        elevation: 0,
        title: Text(
          'Investment',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                _buildInvestmentButton("Gold"),
                _buildInvestmentButton("Gold"),
              ],

            ),
            _buildInvestmentButton("Gold"),
            SizedBox(height: 24),
            Container(
              height: 250,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF1E2A57),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: LineChart(
                LineChartData(
                  backgroundColor: Color(0xFF1E2A57),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const months = ['OCT', 'NOV', 'DEC', 'JAN', 'FEB', 'MAR'];
                          final monthIndex = value.toInt() % months.length;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.onMonthTapped(monthIndex);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: monthIndex == controller.selectedMonthIndex
                                      ? Colors.orange
                                      : Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  months[monthIndex],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.blueAccent,
                      barWidth: 5,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      spots: controller.getChartSpots(),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: index == controller.selectedMonthIndex ? 6 : 4,
                            color: index == controller.selectedMonthIndex
                                ? Colors.orange
                                : Colors.blueAccent,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(color: Colors.blue[200]),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = controller.transactions[index];
                  return ListTile(
                    title: Text(transaction.title, style: TextStyle(color: Colors.white)),
                    subtitle: Text(transaction.subtitle, style: TextStyle(color: Colors.grey)),
                    trailing: Text(transaction.amount, style: TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInvestmentButton(String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.yellow, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      label,
      style: TextStyle(color: Colors.yellow, fontSize: 16),
    ),
  );
}
