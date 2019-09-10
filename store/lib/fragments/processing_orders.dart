import 'package:flutter/material.dart';
import 'package:store/controllers/order_controller.dart';
import 'package:store/models/order.dart';
import 'package:store/widgets/order_widget.dart';

class ProcessingOrdersFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_ProcessingOrdersFragmentState();

}

class _ProcessingOrdersFragmentState extends State<ProcessingOrdersFragment>{
  List<Order> orders;
  @override
  void initState() {
    super.initState();
    OrderController.getNewOrders().then((orders) {
      if(mounted)
        setState(() {
          this.orders = orders;
        });
    });
  }
  bool acceptance=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: orders == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                child: Text("YOU HAVE 3 IN PROCESS ORDER(S)",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              );
            }
            return OrderWidget(order: orders[index-1],);
          },
          itemCount: orders.length+1,
        ),
      ),
    );
  }
}