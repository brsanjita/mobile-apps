import 'package:common/models/wallet/wallet.dart';
import 'package:flutter/material.dart';

class WalletWidget extends StatelessWidget {
  final Wallet wallet;
  final Function() onTap;
  const WalletWidget({Key key, this.wallet, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(wallet.logo),
          ),
          title: Text(wallet.name),
          trailing: wallet.linked
              ? Text("₹${wallet.balance}",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54))
              : InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Link Account",
                      style: TextStyle(color: Colors.orange,fontSize: 14.0,fontWeight: FontWeight.bold),
                    ),
                  ))),
    );
  }
}
