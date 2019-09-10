import 'package:customer/models/restaurant/restaurant_item.dart';
import 'package:flutter/material.dart';

class BasketAddScreen extends StatefulWidget {
  final RestaurantItem item;

  const BasketAddScreen({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BasketAddScreenState();
}

class _BasketAddScreenState extends State<BasketAddScreen> {
  int numberOfOrders = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add To Basket"),
      ),
      body: Column(
        children: <Widget>[_buildItemWidget(), _buildAddButton()],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Item Total \$ ${widget.item.price * numberOfOrders}",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.white,
                elevation: 0.0,
                child: Text(
                  "Add Item",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemWidget() {
    return ListTile(
      title: Text(
        "${widget.item.title}",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "${widget.item.isNonVeg ? "Non Veg" : "Veg"}",
        style:
            TextStyle(color: widget.item.isNonVeg ? Colors.red : Colors.green),
      ),
      trailing: Text(
        "\$ ${widget.item.price}",
        style: TextStyle(
            color: widget.item.isNonVeg ? Colors.red : Colors.green,
            fontWeight: FontWeight.w600,
            fontSize: 18.0),
      ),
    );
  }

  Widget _buildAddButton() {
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
            "$numberOfOrders",
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
    if (count + numberOfOrders <= 0) {
      return;
    }
    setState(() {
      numberOfOrders += count;
    });
  }
}
