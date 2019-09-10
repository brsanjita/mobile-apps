import 'package:common/widgets/rounded_button.dart';
import 'package:customer/models/personal_service/personal_service.dart';
import 'package:customer/widgets/location_search/location_app_bar.dart';
import 'package:customer/widgets/personal_service/personal_service_widget.dart';
import 'package:flutter/material.dart';

class PersonalServiceScreen extends StatefulWidget {
  final Future<List<PersonalServiceProvider>> future;
  final bool applyFilter;
  final String label;

  const PersonalServiceScreen(
      {Key key,
      this.applyFilter = false,
      @required this.future,
      this.label = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalServiceScreenState();
}

class _PersonalServiceScreenState extends State<PersonalServiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<PersonalServiceProvider> services = [];
  List<PersonalServiceProvider> selectedOnes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocationAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Text(
              "${widget.label}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            color: Color(0xffeeeeee),
          ),
          Expanded(
            child: FutureBuilder(
              future: widget.future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.connectionState == null) {
                  return Center(child: Text("Some error"));
                }
                services = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) => PersonalServiceWidget(
                    homeService: services[index],
                    onSelected: (val) {
                      if (val && selectedOnes.contains(services[index])) {
                        selectedOnes.add(services[index]);
                      } else {
                        selectedOnes.remove(services[index]);
                      }
                    },
                  ),
                  itemCount: services.length,
                  shrinkWrap: true,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RoundedButton(
          widget.applyFilter ? "Filter" : "Next",
          onPressed: () {
            if (!widget.applyFilter)
              Navigator.of(context).pushNamed('/serviceOrder');
            else {
              Navigator.of(context).pop();
            }
          },
          color: Colors.black,
        ),
      ),
    );
  }
}
