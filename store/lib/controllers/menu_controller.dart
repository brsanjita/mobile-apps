
import 'package:store/models/menu_item.dart';

class MenuController {

  static Future<List<MenuItem>> getMenuItems()async{
    return [
      MenuItem(title: "Milk Bottle",category: "Baby Products",inStock: true,price: 3.50),
      MenuItem(title: "Baby Bag",category: "Baby Products",inStock: true,price: 20.00),
      MenuItem(title: "Fruit Juice",category: "Beverages",inStock: true,price: 10.00),
      MenuItem(title: "Cold Drink",category: "Beverages",inStock: true,price: 15.00),
    ];
  }

}