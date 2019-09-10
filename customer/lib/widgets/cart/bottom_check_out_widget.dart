import 'package:contacts_service/contacts_service.dart';
import 'package:customer/models/cart/cart_order.dart';
import 'package:customer/screens/personal_service/cart_screen.dart';
import 'package:flutter/material.dart';

class BottomCheckOutWidget extends StatelessWidget {
  final CartOrder cartOrder;

  const BottomCheckOutWidget({Key key, this.cartOrder, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartScreen(
                cartOrder: cartOrder,
              )));
        },
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "\$${cartOrder.totalOrderAmount}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "CheckOut",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
              Container(
                width: 24.0,
                height: 24.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  "${cartOrder.selectedOrders.length}",
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}