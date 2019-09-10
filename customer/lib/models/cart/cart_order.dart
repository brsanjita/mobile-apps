import 'package:customer/models/cart/cart_item.dart';

class CartOrder {
  final List<CartItem> orders;

  CartOrder({this.orders});

  List<CartItem> get selectedOrders =>
      orders.where((item)=>item.noOfOrders>0).toList();


  double get totalOrderAmount {
    double orderPrice = 0;
    selectedOrders.forEach((val) {
      orderPrice += val.orderAmount;
    });
    return orderPrice;
  }
}
