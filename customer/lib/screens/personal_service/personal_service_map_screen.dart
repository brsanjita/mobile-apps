import 'package:customer/models/personal_service/personal_service.dart';
import 'package:customer/widgets/custom_map.dart';
import 'package:customer/widgets/personal_service/personal_service_provider_widget.dart';
import 'package:flutter/material.dart';

class PersonalServiceMapScreen extends StatefulWidget {
  final List<PersonalServiceProvider> services;

  const PersonalServiceMapScreen({Key key, this.services}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalServiceMapScreenState();
}

class _PersonalServiceMapScreenState extends State<PersonalServiceMapScreen> {
  CustomMapController mapController;

  @override
  Widget build(BuildContext context) {
    return CustomMap(
      onControllerCompleted: (controller) {
        this.mapController = controller;
        this.mapController.addData(widget.services);
      },
      onTap: (val){
        showModalBottomSheet(context: context, builder: (context)=>PersonalServiceProviderWidget(provider: val,));
      },
    );
  }
}
