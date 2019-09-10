import 'package:customer/models/personal_service/personal_service.dart';
import 'package:customer/screens/personal_service/personal_service_map_screen.dart';
import 'package:customer/widgets/personal_service/personal_service_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PersonalServiceOrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonalServiceOrderScreenState();
}

class _PersonalServiceOrderScreenState extends State<PersonalServiceOrderScreen> {
  int option = 0;
  List<PersonalServiceProvider> services = [];

  @override
  void initState() {
    services = [
      PersonalServiceProvider(
        position: LatLng(17.3616, 78.4747),
        icon: "assets/images/picker.png",
        id: "123",
        title: "Balamurali Pandranki",
      ),
      PersonalServiceProvider(
        position: LatLng(17.4239, 78.4738),
        icon: "assets/images/picker.png",
        id: "124",
        title: "Bhavneet Singh",
      ),
      PersonalServiceProvider(
        position: LatLng(17.4062, 78.4691),
        icon: "assets/images/picker.png",
        id: "125",
        title: "Babu",
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.white, width: 1.0)),
              margin: EdgeInsets.all(6.0),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildActionIcon(Icon(Icons.list), () {
                    setState(() {
                      option = 0;
                    });
                  }, option == 0),
                  buildActionIcon(Icon(Icons.map), () {
                    setState(() {
                      option = 1;
                    });
                  }, option == 1),
                ],
              ))
        ],
      ),
      body: option == 0
          ? buildServicesList()
          : PersonalServiceMapScreen(
              services: services,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.filter_list),
      ),
    );
  }

  Widget buildServicesList() {
    return ListView.builder(
      itemBuilder: (context, index) => PersonalServiceProviderWidget(
        provider: services[index],
      ),
      itemCount: services.length,
      shrinkWrap: true,
    );
  }

  Widget buildActionIcon(Icon icon, Function() onTap, bool selected) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            height: 48.0,
            width: 56.0,
            decoration: BoxDecoration(
                color: selected ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(4.0)),
            alignment: Alignment.center,
            child: icon));
  }
}
