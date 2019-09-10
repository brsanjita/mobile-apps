import 'package:customer/models/cart/cart_item.dart';

class RestaurantItem extends CartItem {
  bool isNonVeg;
  String category;
  RestaurantItem(
      id, title, price, this.isNonVeg, this.category, itemStatus,noOfOrders)
      : super(id, title, price, "Available", noOfOrders);

  RestaurantItem.named(
      {id, title, price, this.isNonVeg, this.category, itemStatus,noOfOrders})
      : super(id, title, price, "Available", noOfOrders);


}
