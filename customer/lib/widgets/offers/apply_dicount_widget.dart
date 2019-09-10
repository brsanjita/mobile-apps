import 'package:customer/models/offer/offer.dart';
import 'package:customer/screens/offers.dart';
import 'package:flutter/material.dart';

class ApplyDiscountWidget extends StatefulWidget {
  final Function(Offer) onOfferSelected;

  const ApplyDiscountWidget({Key key, @required this.onOfferSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApplyDiscountWidgetState();
}

class _ApplyDiscountWidgetState extends State<ApplyDiscountWidget> {
  Offer discount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: ListTile(
        onTap: fetchOffer,
        title: Text(
          discount != null ? "${discount.promoCode}" : "Apply Coupon",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
        ),
        subtitle: discount != null
            ? Text(
                "Coupon Applied",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              )
            : null,
        trailing: IconButton(
          icon: Icon(
            discount != null ? Icons.clear : Icons.arrow_forward_ios,
            color: Colors.green,
          ),
          onPressed: () {
            if (discount != null) {
              setState(() {
                this.discount = null;
              });
              widget.onOfferSelected(null);
            } else {
              fetchOffer();
            }
          },
        ),
      ),
    );
  }

  void fetchOffer() async {
    Offer offer = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OffersScreen(
              canApply: true,
            )));
    this.discount = offer;
    widget.onOfferSelected(discount);
    if (mounted) setState(() {});
  }
}
