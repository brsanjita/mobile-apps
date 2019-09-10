

import 'package:customer/models/cart/cart_item.dart';

class BookService extends CartItem{
  final String title;
  final String id;
  final String category;
  final double price;
  final bool isBooked;
  final String specialInstruction;
  BookService({this.title, this.id, this.category, this.price, this.isBooked,this.specialInstruction, }) : super(id, title, price, "Available", isBooked?1:0);

  @override
  bool operator ==(other) {
    return id==(other.id);
  }
  @override
  int get hashCode => super.hashCode;
}
