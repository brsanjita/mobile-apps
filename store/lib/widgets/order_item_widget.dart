import 'package:flutter/material.dart';
import 'package:store/models/order_item.dart';
import 'package:store/widgets/ease_in_widget.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderItem orderItem;
  const OrderItemWidget({Key key, this.orderItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 8.0,
                  spreadRadius: 0.05)
            ],
            borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    orderItem.name,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      "x ${orderItem.count}",
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\$ ${orderItem.actualPrice}",
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            fontSize: 16.0,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "\$ ${orderItem.actualPrice}",
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
