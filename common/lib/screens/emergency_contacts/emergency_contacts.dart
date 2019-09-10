import 'package:common/widgets/emergency_contacts/emergency_contact_widget.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'contacts_screen.dart';

class EmergencyContactsScreen extends StatefulWidget {
  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List<Contact> emergencyContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Emergency Contacts"),
              centerTitle: false,
            ),
          ),
          SliverList(delegate: SliverChildListDelegate.fixed([
            emergencyContacts.length>0?buildContactsList():buildPlaceholderWidget(),
          ]))
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "You can add up to 5 contacts",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: RoundedButton(
              "Add Contacts",
              onPressed: () async {
                List<Contact> contact = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactsScreen()));
                if (contact != null && contact.length > 0) {
                  if (this.emergencyContacts.length + contact.length <= 5) {
                    this.emergencyContacts.addAll(contact);
                    setState(() {});
                  } else {
                    if (key.currentContext != null) {
                      key.currentState.showSnackBar(SnackBar(
                          content:
                              Text("You can not add more than 5 contacts.")));
                    }
                  }
                }
              },
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactsList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
      physics:ClampingScrollPhysics(),
      itemBuilder: (context, index) => EmergencyContactWidget(
            contact: emergencyContacts[index],
            onTap: (){
              showDialog(context: context,builder: (context)=>buildAlertDialog(emergencyContacts[index]));
            },
          ),
      itemCount: emergencyContacts.length,
      shrinkWrap: true,
    );
  }

  Widget buildPlaceholderWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.call,
              size: 96.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "For your Safety",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Send alert to your friends/family members in case of an emergency",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: Text(
                "Please add them to your emergency contacts",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildAlertDialog(Contact contact){
    return AlertDialog(
      content: Text("Do you want to delete this contact?"),
      actions: <Widget>[
        FlatButton(onPressed: (){}, child: Text("Cancel")),
        FlatButton(onPressed: (){
          this.emergencyContacts.remove(contact);
          setState(() {

          });
          Navigator.of(context).pop();
        }, child: Text("Ok")),
      ],
    );
  }
}
