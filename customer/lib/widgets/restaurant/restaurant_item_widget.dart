import 'package:customer/models/restaurant/restaurant_item.dart';
import 'package:flutter/material.dart';

class RestaurantItemWidget extends StatefulWidget {
  final RestaurantItem item;
  final Function(int) onOrdersSelected;
  const RestaurantItemWidget({Key key, @required this.item, this.onOrdersSelected, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantItemWidgetState();
}

class _RestaurantItemWidgetState extends State<RestaurantItemWidget> {
  @override
  Widget build(BuildContext context) {
    int noOfOrders=widget.item.noOfOrders??0;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          _buildFoodMark(),
          SizedBox(width: 8.0,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "${widget.item.itemStatus}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Text(
                      "${widget.item.title}",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text(
                      "\$ ${widget.item.price}",
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          noOfOrders==0?RaisedButton(
            onPressed: () {

                addToOrders(1);
            },
            child: Text("Add"),
            color: Colors.green,
            elevation: 0.0,
            textColor: Colors.white,
          ):_buildAddButton()
        ],
      ),
    );
  }

  Widget _buildFoodMark() {
    Color color = widget.item.isNonVeg ? Colors.red : Colors.green;
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.5),
      ),
      child: CircleAvatar(
        radius: 4.0,
        backgroundColor: color,
      ),
    );
  }
  Widget _buildAddButton() {
    int noOfOrders=widget.item.noOfOrders??0;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                addToOrders(-1);
              }),
          Text(
            "${noOfOrders}",
            style: TextStyle(
              fontSize: 16.0,
              color: widget.item.isNonVeg ? Colors.red : Colors.green,
            ),
          ),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addToOrders(1);
              }),
        ],
      ),
    );
  }

  void addToOrders(int count) {
    int noOfOrders=widget.item.noOfOrders??0;
    if (count + noOfOrders < 0) {
      return;
    }
    widget.onOrdersSelected( count);

  }
}
