import 'package:customer/models/cart/cart_item.dart';
import 'package:customer/models/cart/cart_order.dart';
import 'package:customer/models/restaurant/restaurant.dart';
import 'package:customer/models/restaurant/restaurant_item.dart';
import 'package:customer/screens/restaurant/restaurant_search_delegate.dart';
import 'package:customer/screens/restaurant/restaurant_search_screen.dart';
import 'package:customer/utils/restaurant_controller.dart';
import 'package:customer/widgets/cart/bottom_check_out_widget.dart';
import 'package:customer/widgets/restaurant/restaurant_favourite_button.dart';
import 'package:customer/widgets/restaurant/restaurant_item_widget.dart';
import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({Key key, this.restaurant}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  bool isLiked = false;

  bool isLoading;
  List<RestaurantItem> items = [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() async {
    setState(() {
      isLoading = true;
    });
    items = await RestaurantController.getItems(widget.restaurant.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.restaurant.title}"),
        actions: <Widget>[
          RestaurantFavouriteButton(
            onSelected: (val) {
              isLiked = val;
            },
            restaurant: widget.restaurant,
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: items == null
                  ? null
                  : () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantSearchScreen(
                              items: items,
                              onOrderSelected: (item, noOfOrders) {
                                item.addOrders(noOfOrders);
                                if (mounted) setState(() {});
                              })));
                    }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildHeader(),
            buildCategory("North Indian"),
            buildList(),
            buildCategory("South Indian"),
            buildList()
          ],
        ),
      ),
      bottomNavigationBar: BottomCheckOutWidget(
        cartOrder: CartOrder(orders: items),
      ),
    );
  }

  Widget buildCategory(String category) {
    return Container(
      padding: EdgeInsets.all(12.0),
      color: Colors.grey.withOpacity(0.8),
      child: Text(
        "$category",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          title: Text(
            "${widget.restaurant.title}",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "${widget.restaurant.category}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing:
              IconButton(icon: Icon(Icons.info_outline), onPressed: () {}),
        ),
        Divider(),
        Row(
          children: <Widget>[
            buildDetailWidget("★ ${widget.restaurant.rating}",
                "${widget.restaurant.noOfRatings} Ratings"),
            buildDetailWidget(
                "${widget.restaurant.deliveryDuration} mins", "Delivery Time"),
            buildDetailWidget(
                "\$ ${widget.restaurant.pricePerPerson}", "For One"),
          ]
              .map((child) => Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: child,
                  )))
              .toList(),
        ),
        Divider(),
        Center(
          child: Text(
            "${widget.restaurant.discountOption}",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget buildDetailWidget(String title, String subtitle) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "$title",
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            "$subtitle",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
        ),
      ],
    );
  }

  Widget buildList() {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) => RestaurantItemWidget(
              item: items[index],
              onOrdersSelected: (val) {
                CartItem item = items[index];
                print("Items Amount ${item.id} ${item.noOfOrders}");
                if (item.noOfOrders == null) {
                  item.noOfOrders = 0;
                }
                item.addOrders(val);
                setState(() {});
              },
            ),
            itemCount: items.length,
            shrinkWrap: true,
          );
  }
}
