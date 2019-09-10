import 'package:flutter/material.dart';
import 'package:store/controllers/order_controller.dart';
import 'package:store/models/order.dart';
import 'package:store/widgets/order_widget.dart';

class NewOrdersFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewOrdersFragmentState();
}

class _NewOrdersFragmentState extends State<NewOrdersFragment> {
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
                      child: Text("YOU HAVE 1 NEW ORDER(S)",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    );
                  }
                  return OrderWidget(order: orders[index-1],);
                },
                itemCount: orders.length+1,
              ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2.0,
              blurRadius: 12.0,
              offset: Offset(0.0, -1.5)
            )
          ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Accepting Orders",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.0),),
            Switch(activeColor: Color(0xff006400),  value: acceptance,onChanged: (val){
              setState(() {
                this.acceptance=val;
              });
            },)
          ],
        ),
      ),
    );
  }
}
