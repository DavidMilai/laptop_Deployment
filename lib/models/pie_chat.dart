import 'package:flutter/material.dart';
import 'chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChat extends StatelessWidget {
  final List<Deployment> data;
  PieChat({@required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Deployment, String>> series = [
      charts.Series(
          id: "subscribers",
          data: data,
          domainFn: (Deployment series, _) => series.faculty,
          measureFn: (Deployment series, _) => series.number,
          colorFn: (Deployment series, _) => series.barColors),
    ];

    return Container(
      padding: EdgeInsets.all(10),
      child: charts.PieChart(
        series,
        animate: true,
      ),
    );
  }
}
