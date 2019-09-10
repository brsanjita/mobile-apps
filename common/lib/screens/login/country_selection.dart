import 'dart:convert';

import 'package:common/models/login/country.dart';
import 'package:common/utils/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  bool searching;
  String search = '';
  List<Country> countries;

  Map<String, String> countryCodes = {};

  @override
  void initState() {
    super.initState();
    searching = false;
    SearchController.getCountries().then((result) {
      this.countries = result;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !searching,
        title: !searching ? Text("Select Country") : buildSearchBar(),
        actions: <Widget>[
          !searching
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      searching = true;
                    });
                  },
                )
              : FlatButton(
                  onPressed: () {
                    setState(() {
                      searching = false;
                      search = '';
                    });
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ))
        ],
      ),
      body: Query(
        options: QueryOptions(
          document: '''
                   query GetCountries{
                     countries{
                       totalCount
                       nodes{
                        id
                        countryName
                        phoneCode
                       }
                     }
                   }''',
        ),
        builder: (QueryResult result, {VoidCallback refetch, fetchMore}) {
          if (result.loading)
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          print("Result ${result.data}");
          countries=SearchController.getCountriesFromData(result.data);
          return buildCountriesList();
        },
      ),
    );
  }

  Widget buildSearchBar() {
    return CupertinoTextField(
      onChanged: (val) {
        setState(() {
          this.search = val;
        });
      },
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
      prefix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Icon(
          Icons.search,
          color: Colors.black,
          size: 20.0,
        ),
      ),
      placeholder: "Search Country",
      placeholderStyle: TextStyle(fontSize: 16.0),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  Widget buildCountriesList() {
    if (this.countries == null)
      return Center(child: CircularProgressIndicator());
    print("Search $search");
    List<Country> countries = this
        .countries
        .where((country) =>
            country.countryName.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
    print("Length ${countries.length}");
    Map<String, List<Country>> countryGroup = {};
    countries.forEach((val) {
      String first = val.countryName.substring(0, 1);
      if (!countryGroup.containsKey(first)) {
        countryGroup.putIfAbsent(first, () => []);
      }
      countryGroup[first].add(val);
    });
    List<String> keys = countryGroup.keys.toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        List<Country> subCountries = [];
        subCountries = countryGroup[keys[index]];
        return ListView.separated(
          itemBuilder: (context, subIndex) {
            if (subIndex == 0) {
              return Container(
                color: Colors.black,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  keys[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
              );
            }
            return ListTile(
              onTap: () {
                Navigator.of(context).pop(subCountries[subIndex - 1].phoneCode);
              },
              title: Text(subCountries[subIndex - 1].countryName),
              trailing: Text(subCountries[subIndex - 1].phoneCode),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: subCountries.length + 1,
        );
      },
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: keys.length,
    );
  }
}
