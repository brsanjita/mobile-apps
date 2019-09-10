import 'package:customer/screens/personal_service/personal_service_screen.dart';
import 'package:customer/utils/personal_service_controller.dart';
import 'package:flutter/material.dart';

class CarWashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarWashScreenState();

}

class _CarWashScreenState extends State<CarWashScreen> {
  @override
  Widget build(BuildContext context) {
    return PersonalServiceScreen(
      label:"Car Wash",
      future: PersonalServiceController.getCarWashServices(),
    );
  }

}