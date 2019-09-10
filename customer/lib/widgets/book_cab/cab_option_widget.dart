import 'package:common/models/taxi.dart';
import 'package:flutter/material.dart';

class TaxiOptionWidget extends StatelessWidget {
  final Taxi taxi;
  final bool selected;
  const TaxiOptionWidget({Key key, this.taxi, this.selected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: selected?1.0:0.6,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width / 5),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8.0),
            child: Icon(
              Icons.local_taxi,
              color: Colors.white,
              size: 22.0,
            ),
            padding: EdgeInsets.all(12.0),
          ),
          Text(
            taxi.title,
            style: TextStyle(fontSize: 14.0),
          ),
          Text(
            "\$ ${taxi.price}",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

}