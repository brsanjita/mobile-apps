import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/controllers/order_controller.dart';
import 'package:store/models/linear_sales.dart';
import 'package:store/widgets/options_dialog.dart';
import 'package:store/widgets/points_line_chart.dart';
import 'package:store/widgets/tap_input_widget.dart';

class OrderStatisticsScreen extends StatefulWidget {
  @override
  _OrderStatisticsScreenState createState() => _OrderStatisticsScreenState();
}

class _OrderStatisticsScreenState extends State<OrderStatisticsScreen> {
  String year='2019';
  int noOfOrders=0;
  @override
  Widget build(BuildContext context) {
    List<LinearSales>sales=OrderController.getOrders(int.parse(year));
   return Scaffold(
      appBar: AppBar(
        title: Text("Order Statistics"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: (){})
        ],
      ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
       child: Column(
         children: <Widget>[
           TapInputWidget(onTap: () {
             showDialog(
                 context: context,
                 builder: (context) => OptionsDialog(
                   title: "Year",
                   options: ["2017", "2018", "2019"],
                   onSelected: (val) {
                     setState(() {
                       this.year=val;
                     });
                   },
                 ));
           },label: "Year",value: year,),
           Expanded(child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 12.0),
             child: PointsLineChart(sales:sales,),
           )),
           Card(
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text("Number of Orders",style: TextStyle(fontSize: 16.0),),
                       Text("${sales.length}",style: TextStyle(fontSize: 16.0),),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top:8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text("Total Earnings",style: TextStyle(fontSize: 16.0),),
                         Text("\$${sales.length*100}",style: TextStyle(fontSize: 16.0),),
                       ],
                     ),
                   )
                 ],
               ),
             ),
           )
         ],
       ),
     ),
    );
  }
}