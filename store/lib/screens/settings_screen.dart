import 'package:flutter/material.dart';
import 'package:store/widgets/custom_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomInputWidget(
                onSubmitted: (val){},
                label: "Estimated time to prepare",
              ),
              CustomInputWidget(
                onSubmitted: (val){},
                label: "Max number of items added by user",
              ),
              CustomInputWidget(
                onSubmitted: (val){},
                label: "Minimum Order Price",
              ),
              buildCard("Set Store Details", (){
                Navigator.of(context).pushNamed('/storeDetails');
              }),
              buildCard("Set Businees Hours", (){
                Navigator.of(context).pushNamed('/setTimings');
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoundedButton("Submit",onPressed: (){},color: Colors.black,),
    );
  }
  Widget buildCard(String label,Function onTap,){
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        title: Text(label,style: TextStyle(fontSize: 18.0),),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}