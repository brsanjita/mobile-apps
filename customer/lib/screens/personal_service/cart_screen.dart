import 'package:common/widgets/rounded_button.dart';
import 'package:customer/models/cart/cart_item.dart';
import 'package:customer/models/cart/cart_order.dart';
import 'package:customer/models/offer/offer.dart';
import 'package:customer/models/personal_service/book_service.dart';
import 'package:customer/models/personal_service/book_service_order.dart';
import 'package:customer/screens/personal_service/booking_date_selection_screen.dart';
import 'package:customer/widgets/offers/apply_dicount_widget.dart';
import 'package:customer/widgets/selection_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final CartOrder cartOrder;

  const CartScreen({Key key,@required this.cartOrder})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String currentAddress = "At User Location";
  Offer offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildBill(),
            ApplyDiscountWidget(
              onOfferSelected: (offer) {
                setState(() {
                  this.offer = offer;
                });
              },
            ),
            buildSelectionOption(
              title: "Select Payment Method",
              initialValue: paymentMethod,
              options: ["Cash", "Credit Card"],
              onSelected: (val) {
                setState(() {
                  paymentMethod = val;
                });
                Navigator.of(context).pop();
              },
            ),
            buildSelectionOption(
              title: "Select Address",
              initialValue: currentAddress,
              options: ["At User Location", "At Provider Location"],
              onSelected: (val) {
                setState(() {
                  currentAddress = val;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedButton(
          "Book Later",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BookingDateSelectionScreen()));
          },
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildBill() {
    List<CartItem> services = widget.cartOrder.selectedOrders;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: services.map((service) => _buildBillItem(service)).toList()
            ..add(buildDiscountWidget())
            ..add(Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total Amount",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
                  ),
                  Text(
                    "\$${discountedPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.green),
                  ),
                ],
              ),
            )),
        ),
      ),
    );
  }

  double get discountedPrice {
    double discount = offer == null ? 0.0 : offer.discount;
    return (1 - discount / 100) *
        100 *
        widget.cartOrder.totalOrderAmount /
        100;
  }

  Widget buildDiscountWidget() {
    return offer == null
        ? Container(
            width: 0.0,
            height: 0.0,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Promotion",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "-\$${(offer.discount / 100 * widget.cartOrder.totalOrderAmount).toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.green),
                    )
                  ],
                ),
                Divider()
              ],
            ),
          );
  }

  Widget _buildBillItem(CartItem service) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${service.title}",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
              ),
              Text(
                "\$${service.orderAmount.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.green),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  String paymentMethod = "Cash";

  Widget buildSelectionOption(
      {String title,
      List<String> options,
      String initialValue,
      Function(String) onSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
              FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SelectionBottomSheet(
                            title: title,
                            initialValue: initialValue,
                            options: options,
                            onSelected: onSelected));
                  },
                  child: Text(
                    "Change",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "$initialValue",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
