import 'package:flutter/material.dart';
import 'package:store/models/menu_item.dart';
import 'package:store/models/order_item.dart';

import 'ease_in_widget.dart';

class MenuItemWidget extends StatefulWidget {
  final MenuItem menuItem;

  const MenuItemWidget({Key key, this.menuItem}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuItemWidgetState();

}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  MenuItem item;
  bool inStock=false;
  @override
  void initState() {
    super.initState();
    item=widget.menuItem;
    inStock=item.inStock;
  }
  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 8.0,
                  spreadRadius: 0.05)
            ],
            borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.title,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Switch(
                          value: inStock,
                          onChanged: (val){
                            setState(() {
                              inStock=val;
                            });
                          },
                        ),
                        Text(inStock?"In Stock":"Not Avaialable",style: TextStyle(color: inStock?Theme.of(context).primaryColor:Colors.black,fontSize: inStock?16.0:14.0),)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "\$ ${item.price}",
                    style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColor
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

}