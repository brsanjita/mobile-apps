import 'package:customer/models/restaurant/restaurant.dart';
import 'package:customer/screens/restaurant/restaurant_details_screen.dart';
import 'package:customer/screens/restaurant/restaurant_screen.dart';
import 'package:customer/widgets/ease_in_widget.dart';
import 'package:flutter/material.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantWidget({Key key, @required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RestaurantDetailsScreen(restaurant: restaurant,)));
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      restaurant.thumbnail,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "${restaurant.title}",
                            style: TextStyle(
                                fontSize:16.0, fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "${restaurant.category}",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "\$${restaurant.pricePerPerson} per person",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "🕒 ${restaurant.deliveryDuration} mins",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "\$${restaurant.pricePerPerson} min order",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                restaurant.discountOption,
                style: TextStyle(
                    fontSize: 14.0, color: Colors.red, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
