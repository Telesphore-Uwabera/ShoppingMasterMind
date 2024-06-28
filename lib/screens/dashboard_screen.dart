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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                color: Colors.blue,  // Corrected this line
                barWidth: 4,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
