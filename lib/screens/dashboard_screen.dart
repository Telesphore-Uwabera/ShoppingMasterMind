import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart.dart';

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
  List<charts.Series<ChartModel, int>> _series =[] ;

  @override
  void initState() {
    super.initState();
    _series = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart( _series,  animate: true,
    );
  }

  List<charts.Series<ChartModel, int>> _createSampleData() {
    final data = [
      ChartModel(label: 1, value: 15),
      ChartModel(label: 2, value: 24),
      ChartModel(label: 3, value: 12),
      ChartModel(label: 4, value: 23),
      ChartModel(label: 5, value: 20),
      ChartModel(label: 6, value: 33),
      ChartModel(label: 7, value: 15),
      ChartModel(label: 8, value: 45),
    ];

    return [
      charts.Series<ChartModel, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartModel sales, _) => sales.label,
        measureFn: (ChartModel sales, _) => sales.value,
        data: data,
      )
    ];
  }
}
