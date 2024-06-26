import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Chart Demo'),
        ),
        body: const ChartScreen(),
      ),
    );
  }
}

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late ChartData chartData;

  @override
  void initState() {
    super.initState();
    chartData = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      painter: LineChartPainter(),
      data: chartData,
    );
  }

  ChartData _createSampleData() {
    List<ChartItem> dataItems = [
      ChartItem(label: '1', value: 15),
      ChartItem(label: '2', value: 24),
      ChartItem(label: '3', value: 12),
      ChartItem(label: '4', value: 23),
      ChartItem(label: '5', value: 20),
      ChartItem(label: '6', value: 33),
      ChartItem(label: '7', value: 15),
      ChartItem(label: '8', value: 45),
    ];

    ChartData chartData = ChartData(
      dataRows: [dataItems.map((item) => item.value).toList()],
      xLabels: dataItems.map((item) => item.label).toList(),
      dataRowsColors: [Colors.blue],
    );

    return chartData;
  }
}

class ChartItem {
  final String label;
  final double value;

  ChartItem({required this.label, required this.value});
}
