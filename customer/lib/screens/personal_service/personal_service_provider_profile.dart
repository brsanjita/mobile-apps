import 'package:customer/models/personal_service/personal_service.dart';
import 'package:flutter/material.dart';

class PersonalServiceProviderProfileScreen extends StatefulWidget {
  final PersonalServiceProvider serviceProvider;

  const PersonalServiceProviderProfileScreen({Key key,@required this.serviceProvider}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PersonalServiceProviderProfileScreenState();
}

class _PersonalServiceProviderProfileScreenState
    extends State<PersonalServiceProviderProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}
