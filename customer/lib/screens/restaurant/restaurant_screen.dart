import 'package:common/widgets/location_search/location_app_bar.dart';
import 'package:customer/models/restaurant/restaurant.dart';
import 'package:customer/utils/restaurant_controller.dart';
import 'package:customer/widgets/header_location_picker_widget.dart';
import 'package:customer/widgets/restaurant/restaurant_widget.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocationAppBar(),
      body: FutureBuilder(
          future: RestaurantController.getRestaurants(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child:CircularProgressIndicator()
              );
            }
            if(snapshot.data==null){
              return Center(
                  child:Text("Something Wrong Happened")
              );
            }
            List<Restaurant> restaurants = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return RestaurantWidget(
                  restaurant: restaurants[index],
                );
              },
              shrinkWrap: true,
              itemCount: restaurants.length,
            );
          }),
    );
  }
}
