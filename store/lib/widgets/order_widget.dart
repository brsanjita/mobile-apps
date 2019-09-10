import 'package:flutter/material.dart';
import 'package:store/models/order.dart';
import 'package:store/screens/order_detail_screen.dart';
import 'package:store/widgets/ease_in_widget.dart';

class OrderWidget extends StatelessWidget {
  final Order order;

  const OrderWidget({Key key,@required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetailScreen(order:order)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 8.0,
            spreadRadius: 0.05
          )],
          borderRadius: BorderRadius.circular(8.0)
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${order.id}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),),
              Text("#${order.count} Items",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300),),
              Text("${order.orderTime.toUtc().toString().split(" ")[0]}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300),),
            ],
          ),
        ),
      ),
    );
  }

}