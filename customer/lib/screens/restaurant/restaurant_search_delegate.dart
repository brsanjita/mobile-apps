import 'package:customer/models/restaurant/restaurant_item.dart';
import 'package:customer/widgets/restaurant/restaurant_item_widget.dart';
import 'package:flutter/material.dart';

class RestaurantSearchDelegate extends SearchDelegate<RestaurantItem> {
  final List<RestaurantItem> items;
  final Function(RestaurantItem, int) onOrderSelected;

  RestaurantSearchDelegate({this.items, this.onOrderSelected});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed:Navigator.of(context).pop);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(items==null){
      return Container();
    }
    List<RestaurantItem>filtered=items.where((item)=>item.title.toLowerCase().startsWith(query.toLowerCase())).toList() ;
    return  ListView.builder(
        itemBuilder: (context, index) => RestaurantItemWidget(
          item: filtered[index],
          onOrdersSelected: (orders) {
            onOrderSelected(filtered[index], orders);
            },
        ),itemCount: filtered.length,shrinkWrap: true,);

  }


}
