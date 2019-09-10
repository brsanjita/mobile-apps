import 'package:customer/screens/personal_service/personal_service_screen.dart';
import 'package:customer/utils/personal_service_controller.dart';
import 'package:flutter/material.dart';

class HomeCleaningScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeCleaningScreenState();
}

class _HomeCleaningScreenState extends State<HomeCleaningScreen> {
  @override
  Widget build(BuildContext context) {
    return PersonalServiceScreen(
      label:"Home Cleaning",
      future: PersonalServiceController.getHomeCleaningServices(),
    );
  }
}
