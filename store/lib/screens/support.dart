import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("About Us"),
            leading: Icon(Icons.info),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                appBar: AppBar(),
              )));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Privacy Policy"),
            leading: Icon(Icons.lock),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                appBar: AppBar(),
              )));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Terms & Conditions"),
            leading: Icon(Icons.library_books),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                appBar: AppBar(),
              )));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Live Chat"),
            leading: Icon(Icons.chat),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                appBar: AppBar(),
              )));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Contact Us"),
            leading: Icon(Icons.call),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                appBar: AppBar(),
              )));
            },
          ),
        ],
      ),
    );
  }
}