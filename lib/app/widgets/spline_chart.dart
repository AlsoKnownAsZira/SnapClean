import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final List<ChartData> chartData = [
      ChartData(1, 35),
      ChartData(2, 20),
      ChartData(3, 30),
      ChartData(4, 25),
    ];
    final List<ChartData> chartData2 = [
      ChartData(1, 20),
      ChartData(2, 25),
      ChartData(3, 30),
      ChartData(4, 50),
    ];
    final List<ChartData> chartData3 = [
      ChartData(1, 40),
      ChartData(2, 60),
      ChartData(3, 40),
      ChartData(4, 45),
    ];
    return SfCartesianChart(
      legend: Legend(isVisible: true, position: LegendPosition.bottom,isResponsive: true,title: LegendTitle(text: 'Laporan Bulanan')),
      series: <CartesianSeries>[
     
      // Renders spline chart
      SplineSeries<ChartData, int>(
        name: 'Diterima',
          dataSource: chartData,
          color: Colors.red,
          width: 5,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y),
      SplineSeries<ChartData, int>(
        name: 'Diproses',
          dataSource: chartData2,
          color: Colors.yellow,
          width: 5,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y),
      SplineSeries<ChartData, int>(
        name: 'Selesai',
          dataSource: chartData3,
          color: Colors.green,
          width: 5,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
