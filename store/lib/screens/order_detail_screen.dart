import 'package:flutter/material.dart';
import 'package:store/controllers/order_controller.dart';
import 'package:store/models/order.dart';
import 'package:store/models/order_item.dart';
import 'package:store/widgets/decline_dlalog.dart';
import 'package:store/widgets/order_item_widget.dart';

class OrderDetailScreen extends StatefulWidget {
  final Order order;

  const OrderDetailScreen({Key key, @required this.order}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen>
    with TickerProviderStateMixin<OrderDetailScreen> {
  AnimationController controller;
  Order order;
  List<OrderItem> orderItems;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController bottomSheetController;
  @override
  void initState() {
    super.initState();
    order = widget.order;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    OrderController.getItems(order.id).then((items) {
      if (mounted)
        setState(() {
          orderItems = items;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            if (showingBill) {
              setState(() {
                showingBill = false;
              });
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Order#${order.id}",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "${order.orderTime.toString().split(" ")[0]}",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.0),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          IconButton(icon: Icon(Icons.refresh), onPressed: () {})
        ],
      ),
      body: Scaffold(
        key: key,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: Color(0xffeeeeee),
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Text(
                  "${order.count} Items",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              orderItems == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                      itemBuilder: (context, index) => OrderItemWidget(
                            orderItem: orderItems[index],
                          ),
                      itemCount: order.count,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: ListTile(
            onTap: () {
              if (!showingBill)
                showBill();
              else {
                Navigator.of(context).pop();
                setState(() {
                  showingBill = false;
                });
              }
            },
            leading: !showingBill
                ? Icon(Icons.keyboard_arrow_up)
                : Icon(Icons.keyboard_arrow_down),
            title: Text("Total Bill Amount",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
            trailing: Text(
              "\$ 23.15",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.normal)),
                  padding:
                      EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
                ),
              
            ),
            Expanded(
                child: RaisedButton(
                  onPressed: () {
                    showDialog(context: context, child: DeclineDialog(order: order,));
                  },
                  child: Text("Decline",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.normal),),
                  color: Colors.red,
                  padding:
                      EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
                ),
              
            )
          ],
        ),
      ),
    );
  }

  bool showingBill = false;
  void showBill() {
    setState(() {
      showingBill = true;
    });

    bottomSheetController = key.currentState.showBottomSheet(
      (context) => BottomSheet(
            animationController: controller,
            onClosing: () {
              setState(() {
                showingBill = false;
              });
            },
            enableDrag: true,
            elevation: 1.0,
            builder: (context) => Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text("Bill Sub Total",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w300)),
                        trailing: Text(
                          "\$ 23.50",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      ListTile(
                        title: Text("Offer Discount",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w300)),
                        trailing: Text(
                          "-\$ 2.35",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      ListTile(
                        title: Text("Packing Charges",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w300)),
                        trailing: Text(
                          "\$ 2.00",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }
}