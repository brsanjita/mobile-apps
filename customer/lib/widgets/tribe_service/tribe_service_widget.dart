import 'package:customer/models/category.dart';
import 'package:customer/models/tribe_service/tribe_service.dart';
import 'package:flutter/material.dart';

class TribeServiceWidget extends StatelessWidget {
  final TribeService tribeService;

  const TribeServiceWidget({Key key, this.tribeService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        switch(tribeService.category){
          case Category.TAXI_SERVICE:
            Navigator.of(context).pushNamed('/bookCab');
            break;
          case Category.DELIVERY_SERVICE:
            Navigator.of(context).pushNamed('/commonDelivery');
            break;
          case Category.PROFESSIONAL_SERVICE:
          case Category.RENTAL_SERVICE:
            Navigator.of(context).pushNamed('/service');
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Icon(Icons.category,color: Colors.white,),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text("${tribeService.name}",textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
