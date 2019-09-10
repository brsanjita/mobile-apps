import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/widgets/change_password_dialog.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: <Widget>[PopupMenuButton(itemBuilder: (context)=>[
          PopupMenuItem<int>(child: Text("Edit Profile",),value: 0,),
          PopupMenuItem<int>(child: Text("Change Password",),value: 1,),
        ],onSelected: (index){
          if(index==0){
            Navigator.of(context).pushNamed('/editProfile');
          }
          else{
            showDialog(context: context,builder: (context)=>ChangePasswordDialog());
          }
        },)],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
        children: <Widget>[
          buildItem("Restaurant Name", "Store-696681"),
          buildItem("Email", "groc-balamaurali@gmail.com"),
          buildItem("Mobile", "+7013090959"),
          buildItem("Language", "English"),
          buildItem("Currency", "USD"),
        ],
      ),
    );
  }
  Widget buildItem(String label,String value){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16.0),),
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Text(value,style: TextStyle(color: Colors.black,fontSize: 18.0),),
          ),
        ],
      ),
    );
  }
}