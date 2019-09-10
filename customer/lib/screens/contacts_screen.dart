import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool isLoading = true;

  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    getContacts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) =>
                    _buildContactWidget(contacts[index]),
                itemCount: contacts.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
              ));
  }

  void getContacts() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);
    if (permissions[PermissionGroup.contacts] == PermissionStatus.granted) {
      var contacts = await ContactsService.getContacts(withThumbnails: false);
      setState(() {
        isLoading=false;
      });
      print(contacts.toList().length);
      this.contacts=contacts.toList();
    }
  }

  Widget _buildContactWidget(Contact contact) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pop([contact]);
      },
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          "${contact.displayName[0]}",
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      subtitle: Text(
          "${contact.phones.length > 0 ? contact.phones.toList()[0].value : ""}"),
      title: Text("${contact.displayName}"),
    );
  }
}
