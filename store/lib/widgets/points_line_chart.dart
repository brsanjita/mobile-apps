import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:store/models/linear_sales.dart';

class PointsLineChart extends StatelessWidget {
  final List<LinearSales> sales;
  final bool animate;

  PointsLineChart( {@required this.sales,this.animate=true});


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(_getSeries(),
        animate: animate,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true));
  }

  /// Create one series with sample hard coded data.
   List<charts.Series<LinearSales, int>> _getSeries() {
    final data = sales;
    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.orders.length,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
