import 'package:customer/models/restaurant/restaurant_item.dart';
import 'package:customer/widgets/restaurant/restaurant_item_widget.dart';
import 'package:flutter/material.dart';

class RestaurantSearchScreen extends StatefulWidget {
  final List<RestaurantItem> items;
  final Function(RestaurantItem, int) onOrderSelected;

  const RestaurantSearchScreen({Key key, this.items, this.onOrderSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.of(context).pop();
        },color: Colors.black,),
        title: TextField(
          onChanged: (val) {
            setState(() {
              query = val;
            });
          },
          decoration: InputDecoration(border: InputBorder.none,hintText: "Search Items"),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => RestaurantItemWidget(
          item: filtered[index],
          onOrdersSelected: (orders) {
            widget.onOrderSelected(filtered[index], orders);
            setState(() {});
          },
        ),
        itemCount: filtered.length,
        shrinkWrap: true,
      ),
    );
  }

  List<RestaurantItem> get filtered => widget.items
      .where((item) => item.title.toLowerCase().startsWith(query.toLowerCase()))
      .toList();
}
