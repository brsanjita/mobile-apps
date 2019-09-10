import 'package:customer/models/restaurant/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantFavouriteButton extends StatefulWidget {
  final Restaurant restaurant;
  final Function(bool) onSelected;
  const RestaurantFavouriteButton({Key key, this.restaurant, this.onSelected}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RestaurantFavouriteButtonState();

}

class _RestaurantFavouriteButtonState extends State<RestaurantFavouriteButton> {

  bool selected=false;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(selected?Icons.favorite:Icons.favorite_border), onPressed: (){
      setState(() {
        selected=!selected;
        widget.onSelected(selected);
      });
    });
  }

}