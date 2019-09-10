

class CartItem{
  String title;
  String id;
  double price;
  String itemStatus;
  int noOfOrders=0;

  CartItem(this.id,this.title ,this.price, this.itemStatus, this.noOfOrders);


  @override
  int get hashCode =>id.hashCode;

  @override
  bool operator ==(other) {
    return id==other.id;
  }

  bool get isAdded=>noOfOrders>0;

  double get orderAmount=>noOfOrders*price;

  void addOrders(int order){
    noOfOrders+=order;
  }
}