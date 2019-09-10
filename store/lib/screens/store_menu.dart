import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/controllers/menu_controller.dart';
import 'package:store/models/menu_item.dart';
import 'package:store/widgets/menu_item_widget.dart';

class StoreMenuScreen extends StatefulWidget {
  @override
  _StoreMenuScreenState createState() => _StoreMenuScreenState();
}

class _StoreMenuScreenState extends State<StoreMenuScreen> {
  String storeType = "Wine";
  List<MenuItem>items;
  @override
  void initState() {
    super.initState();
    MenuController.getMenuItems().then((items){
      setState(() {
        this.items=items;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
      Map<String,List<MenuItem>>groups={};
      for(MenuItem item in items){
        if(!groups.containsKey(item.category))
        groups.putIfAbsent(item.category,()=>[]);
        var list=groups[item.category];
        list.add(item);
      }
      var keys=groups.keys.toList();
      return Scaffold(
      appBar: AppBar(
        title: Text(storeType + " Menu"),
      ),
      body: items!=null?ListView.builder(itemBuilder: (context,index){
        var group=groups[keys[index]];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(12.0),
              child: Text(keys[index],style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w700),),
            ),
            ListView.builder(itemBuilder: (context,index){
              return MenuItemWidget(
                menuItem: group[index],
              );
            },itemCount: group.length,shrinkWrap: true,physics: ClampingScrollPhysics(),)
          ],
        );
      },itemCount: keys.length,shrinkWrap: true,):Center(child: CircularProgressIndicator(),),
    );
  }
}
