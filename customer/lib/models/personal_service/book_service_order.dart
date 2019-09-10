
import 'package:customer/models/cart/cart_item.dart';

class BookServiceOrder{

  final List<CartItem>items;

  BookServiceOrder({this.items,});

  double get totalOrderAmount{
    double sum=0;
    items.forEach((val)=>sum+=val.price);
    return sum;
  }
}