import 'package:customer/models/offer/offer.dart';
import 'package:customer/utils/offers_controller.dart';
import 'package:customer/widgets/offer_widget.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  final bool canApply;

  const OffersScreen({Key key, this.canApply=true}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<Offer> offers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    OffersController.getOffers().then((val) {
      if (mounted) {
        setState(() {
          isLoading = false;
          this.offers.addAll(val);
        });
      }
    });
  }

  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Offers & Promotions"),
        ),
        body: Column(
          children: <Widget>[
            !widget.canApply
                ? Container(
                    width: 0.0,
                    height: 0.0,
                  )
                : Container(
                    margin: EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration:
                                InputDecoration(labelText: "Enter Promo Code"),
                          ),
                        ),
                        RaisedButton(
                          child: Text(
                            "Apply",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("Offer can not be applied"),
                                ));
                          },
                          elevation: 0.0,
                          padding: EdgeInsets.all(12.0),
                        )
                      ],
                    ),
                  ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => OfferWidget(
                        offer: offers[index],
                        canApply: widget.canApply,
                        onApplied: (offer){
                          Navigator.of(context).pop(offer);
                        },
                      ),
                      itemCount: offers.length,
                      shrinkWrap: true,
                    ),
            ),
          ],
        ));
  }
}
