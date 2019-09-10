import 'package:customer/models/restaurant/restaurant.dart';
import 'package:customer/models/restaurant/restaurant_item.dart';

class RestaurantController {
  static Future<List<Restaurant>> getRestaurants() async {
    return [
      Restaurant.named(
          id: "1234",
          title: "French Liqour",
          category: "Alcohol",
          deliveryDuration: 30,
          pricePerPerson: 5,
          discountOption: "Get 10% off on first order",
          noOfRatings: 5,
          rating: 3.5,
          thumbnail:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Paris_Palais_Royal_Restaurant_Grand_V%C3%A9four_4.jpg/300px-Paris_Palais_Royal_Restaurant_Grand_V%C3%A9four_4.jpg"),
      Restaurant.named(
          id: "1234",
          title: "French Liqour",
          category: "Alcohol",
          deliveryDuration: 30,
          pricePerPerson: 5,
          discountOption: "Get 10% off on first order",
          noOfRatings: 5,
          rating: 3.5,
          thumbnail:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Paris_Palais_Royal_Restaurant_Grand_V%C3%A9four_4.jpg/300px-Paris_Palais_Royal_Restaurant_Grand_V%C3%A9four_4.jpg"),
      Restaurant.named(
          id: "1234",
          title: "French Liqour",
          category: "Alcohol",
          deliveryDuration: 30,
          pricePerPerson: 5,
          discountOption: "Get 10% off on first order",
          noOfRatings: 5,
          rating: 3.5,
          thumbnail:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Paris_Palais_Royal_Restaurant_Grand_V%C3%A9four_4.jpg/300px-Paris_Palais_Royal_Restaurant_Grand_V%C3%A9four_4.jpg"),
    ];
  }

  static Future<List<RestaurantItem>> getItems(String id) async {
    return [
      RestaurantItem.named(
          id: "15",
          title: "Chole Bhature",
          price: 50.0,
          category: "Punjabi",
          isNonVeg: false,
          itemStatus: "Available",
          noOfOrders: 0),
      RestaurantItem.named(
          id: "16",
          title: "Chole Bhature",
          price: 50.0,
          category: "Punjabi",
          isNonVeg: false,
          itemStatus: "Available",
          noOfOrders: 0),
      RestaurantItem.named(
          id: "17",
          title: "Chole Bhature",
          price: 50.0,
          category: "Punjabi",
          isNonVeg: false,
          itemStatus: "Available",
          noOfOrders: 0),
      RestaurantItem.named(
          id: "18",
          title: "Chole Bhature",
          price: 50.0,
          category: "Punjabi",
          isNonVeg: false,
          itemStatus: "Available",
          noOfOrders: 0),
      RestaurantItem.named(
          id: "19",
          title: "Chole Bhature",
          price: 50.0,
          category: "Punjabi",
          isNonVeg: false,
          itemStatus: "Available",
          noOfOrders: 0),
    ];
  }
}
