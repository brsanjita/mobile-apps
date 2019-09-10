import 'package:common/models/taxi.dart';
import 'package:common/screens/wallet/payment_screen.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/screens/offers.dart';
import 'package:customer/widgets/book_cab/cab_option_widget.dart';
import 'package:flutter/material.dart';

class CabRequestWidget extends StatefulWidget {
  final List<Taxi> taxis;
  final Function onSelected;
  const CabRequestWidget({
    Key key,
    this.taxis, this.onSelected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CabRequestWidgetState();
}

class _CabRequestWidgetState extends State<CabRequestWidget> {
  bool useCash = false;
  Taxi selectedTaxi;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black,
            child: Text(
              "Rent a car",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 120.0,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  setState(() {
                    selectedTaxi=widget.taxis[index];
                  });
                },
                child: TaxiOptionWidget(
                      taxi: widget.taxis[index],
                  selected: selectedTaxi==widget.taxis[index],
                    ),
              ),
              scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: widget.taxis.length,),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: () async {
                Map value = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
                if (value != null) {
                  setState(() {
                    useCash = value["useCash"];
                  });
                }
              },
              icon: Icon(Icons.credit_card),
              label: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          useCash ? "Cash" : "Credit Card",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
              color: Colors.transparent,
              elevation: 0.0,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OffersScreen()));
              },
              icon: Icon(Icons.card_giftcard),
              label: Text("Coupon"),
              color: Colors.transparent,
              elevation: 0.0,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  "Request",
                  onPressed: () {
                    widget.onSelected();
                    },
                  color: Colors.black,
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Icon(Icons.local_taxi),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildTaxiScheduler() {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: RoundedButton(
        "Schedule cab",
        onPressed: () {},
        color: Colors.black,
      ),
    );
  }
}
