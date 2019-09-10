import 'dart:math';

import 'package:store/models/linear_sales.dart';
import 'package:store/models/order.dart';
import 'package:store/models/order_item.dart';

class OrderController {
  static Future<List<Order>> getNewOrders() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Order(id: "1614975252315", count: 2, orderTime: DateTime.now()),
      Order(id: "1614975252315", count: 2, orderTime: DateTime.now())
    ];
  }

  static Future<List<OrderItem>> getItems(String orderId) async {
    await Future.delayed(Duration(seconds: 1));
    return [
      OrderItem(
          id: "1614975252315",
          count: 2,
          name: "Milk Bottle",
          actualPrice: "3.50",
          discountedPrice: "3.15"),
      OrderItem(
          id: "1614975252315",
          count: 2,
          name: "Baby Bag",
          actualPrice: "20.00",
          discountedPrice: "18.00")
    ];
  }

  static List<LinearSales> getOrders(int year) {
    Future.delayed(Duration(seconds: 1));
    Random random = Random();
    return List<LinearSales>.generate(
        12,
        (index) => LinearSales(
            month: index + 1,
            orders:
                List<Order>.generate(random.nextInt(10), (index) => Order())));
  }
}
