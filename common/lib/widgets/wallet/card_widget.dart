
import 'package:common/models/wallet/card.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCard creditCard;
  final Function() onTap;
  const CreditCardWidget({Key key,@required this.creditCard, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(backgroundImage: NetworkImage(creditCard.icon),),
          title: Text(creditCard.cardNumber),
          trailing: InkWell(onTap: (){}, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Delete",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
          )),
        ),
      ),
    );
  }

}