import 'package:customer/models/restaurant/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantCarouselWidget extends StatefulWidget {
  final List<Restaurant> restaurants;

  const RestaurantCarouselWidget({Key key, @required this.restaurants})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantCarouselWidgetState();
}

class _RestaurantCarouselWidgetState extends State<RestaurantCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.restaurants
          .map((restaurant) => FadeInImage.assetNetwork(
                placeholder: "",
                image: restaurant.thumbnail,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ))
          .toList(),
      height: 250,
      aspectRatio: 1.0,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      onPageChanged: (int index) {},
      scrollDirection: Axis.horizontal,
    );
  }
}
