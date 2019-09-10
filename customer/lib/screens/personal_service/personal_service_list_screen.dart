import 'package:customer/widgets/personal_service/personal_service_provider_widget.dart';
import 'package:customer/models/personal_service/personal_service.dart';
import 'package:flutter/material.dart';

class PersonalServiceListScreen extends StatefulWidget {
  final List<PersonalServiceProvider> services;

  
  const PersonalServiceListScreen({Key key, @required this.services})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalServiceListScreenState();
}

class _PersonalServiceListScreenState extends State<PersonalServiceListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      itemBuilder: (context, index) => PersonalServiceProviderWidget(),
      itemCount: 5,
      shrinkWrap: true,
    );
  }
}

