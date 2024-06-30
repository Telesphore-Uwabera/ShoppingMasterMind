import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First chart (bar chart)
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 50,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(value.toInt().toString(),
                              style:
                              TextStyle(color: Colors.black, fontSize: 10));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(value.toInt().toString(),
                              style:
                              TextStyle(color: Colors.black, fontSize: 10));
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(toY: 8, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: 10, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(toY: 14, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(toY: 15, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(toY: 13, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(toY: 10, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 7, barRods: [
                      BarChartRodData(toY: 12, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 8, barRods: [
                      BarChartRodData(toY: 20, color: Colors.lightBlueAccent)
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Second chart (line chart)
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  minX: 0,
                  maxX: 8,
                  minY: 0,
                  maxY: 50,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 15),
                        FlSpot(2, 24),
                        FlSpot(3, 12),
                        FlSpot(4, 23),
                        FlSpot(5, 20),
                        FlSpot(6, 33),
                        FlSpot(7, 15),
                        FlSpot(8, 45),
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Third chart (pie chart)
            Container(
              height: 150, // Reduced the height of the pie chart
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 40,
                      title: '40%',
                      radius: 30,
                      titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: 30,
                      title: '30%',
                      radius: 30,
                      titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 15,
                      title: '15%',
                      radius: 30,
                      titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 15,
                      title: '15%',
                      radius: 30,
                      titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Items list',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/add-item');
          }
        },
      ),
    );
  }
}
