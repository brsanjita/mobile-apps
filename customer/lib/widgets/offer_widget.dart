import 'package:customer/models/offer/offer.dart';
import 'package:flutter/material.dart';

class OfferWidget extends StatefulWidget {
  final Offer offer;
  final bool canApply;
  final Function(Offer) onApplied;

  const OfferWidget(
      {Key key, this.offer, this.canApply = false, this.onApplied})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    Offer offer = widget.offer;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blueAccent.withOpacity(0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "USE CODE",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        "${offer.promoCode}",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(text: "Use and Save "),
                      TextSpan(
                          text: "${offer.discount}%",
                          style: TextStyle(color: Colors.green)),
                    ],
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black))),
              ),
            ),
          ],
        ),
        trailing: !widget.canApply
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : null,
        children: !widget.canApply
            ? []
            : <Widget>[
                Container(
                  padding: EdgeInsets.all(6.0),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      widget.onApplied(offer);
                    },
                    color: Colors.green,
                    child: Text(
                      "Apply",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
      ),
    );
  }
}
