import 'package:customer/models/tribe_service/tribe_service.dart';
import 'package:customer/utils/tribe_service_controller.dart';
import 'package:customer/widgets/tribe_service/tribe_service_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String searchQuery = '';

  final double appBarHeight = 66.0;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Query(
        options: QueryOptions(document: createServiceQuery()),
        builder: (QueryResult result, {refetch,fetchMore}) {
          if (result.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (result.hasErrors) {
            return Center(child: Text("${result.errors[0].message}"));
          }

          List<TribeService> services =
              TribeServiceController.parseResponse(result.data);
          services.forEach((val){
            print("Category ${val.category}");
          });
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: Hero(
                      tag: "logotext",
                      child: Text(
                        'tribe',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          decoration: TextDecoration.none,
                          fontSize: 40.00,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  centerTitle: false,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications),
                      iconSize: 27.0,
                      onPressed: () {
                        Navigator.pushNamed(context, "/notifications");
                      },
                      tooltip: "Notifications",
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      padding: EdgeInsets.only(
                          top: statusBarHeight + appBarHeight,
                          right: 16.0,
                          left: 16.0),
                      height: statusBarHeight + appBarHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              child: Text(
                                "Good morning, Balamurali",
                                style: TextStyle(color: Colors.white, fontSize: 26),
                              ),
                              padding: EdgeInsets.only(bottom: 15, top: 10)),
                          buildSearchBar(),
                        ],
                      ),
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate([
                  promotionsWidget(),
                ]),
              ),
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    return GridTile(
                      child: TribeServiceWidget(tribeService: services[index],),
                    );
                  }, childCount: services.length),
                ),
              )
            ],
          );
        },
    ));
  }

  String createServiceQuery() {
    return '''
    query getServices{
      services {
      edges {
        cursor
        node {
          id
          name
          icon
          category
          displayOrder
          subCategories {
            id
            serviceID
            serviceType
            name
            description
            displayOrder
          }
        }
      }
      }
    }
    ''';
  }

  Widget buildSearchBar() {
    return CupertinoTextField(
      onChanged: (val) {
        setState(() {
          this.searchQuery = val;
        });
      },
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
      prefix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Icon(
          Icons.search,
          color: Colors.black,
          size: 20.0,
        ),
      ),
      placeholder: "What are you looking for?",
      placeholderStyle: TextStyle(fontSize: 16.0),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  Widget promotionsWidget() {
    return Container(
      padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.red),
            padding: EdgeInsets.all(5),
            width: 200.0,
          ),
          Divider(
            indent: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.red),
            padding: EdgeInsets.all(5),
            width: 200.0,
          ),
          Divider(
            indent: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.red),
            padding: EdgeInsets.all(5),
            width: 200.0,
          ),
          Divider(
            indent: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.red),
            padding: EdgeInsets.all(5),
            width: 200.0,
          ),
          Divider(
            indent: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.red),
            padding: EdgeInsets.all(5),
            width: 200.0,
          ),
        ],
      ),
    );
  }
}

class Service {
  const Service({this.title, this.color, this.icon, this.data});

  final String title;
  final int color;
  final IconData icon;
  final ServiceData data;
}

class ServiceData {
  const ServiceData({this.route});

  final String route;
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key key, this.service}) : super(key: key);
  final Service service;

  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(service.data.route);
        },
        child: Column(children: <Widget>[
          SizedBox(
              height: 60,
              width: 60,
              child: Card(
                  shape: CircleBorder(),
                  color: Color(service.color),
                  elevation: 0.0,
                  child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(service.icon, size: 30.0, color: Colors.white),
                        ]),
                  ))),
          Text(service.title,
              style: TextStyle(fontSize: 15.0, color: Colors.black)),
        ]));
  }
}
