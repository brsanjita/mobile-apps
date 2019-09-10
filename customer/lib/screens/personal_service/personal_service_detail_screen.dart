import 'package:customer/models/cart/cart_order.dart';
import 'package:customer/models/personal_service/book_service.dart';
import 'package:customer/models/personal_service/book_service_order.dart';
import 'package:customer/models/personal_service/personal_service.dart';
import 'package:customer/models/service_provider_review.dart';
import 'package:customer/screens/personal_service/cart_screen.dart';
import 'package:customer/screens/personal_service/personal_service_provider_profile.dart';
import 'package:customer/utils/personal_service_controller.dart';
import 'package:customer/widgets/cart/bottom_check_out_widget.dart';
import 'package:customer/widgets/personal_service/book_service_widget.dart';
import 'package:customer/widgets/personal_service/service_provider_review_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PersonalServiceDetailScreen extends StatefulWidget {
  final PersonalServiceProvider provider;

  const PersonalServiceDetailScreen({Key key, this.provider}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalServiceDetailScreenState();
}

class _PersonalServiceDetailScreenState extends State<PersonalServiceDetailScreen> {
  List<BookService> bookings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Service Details"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            buildHeader(),
            buildTabBar(),
            SizedBox(
              height: 20.0,
            ),
            [buildServiceList(), buildGallery(), buildReviews()][val]
          ],
        )),
      bottomNavigationBar: BottomCheckOutWidget(cartOrder: CartOrder(orders: bookings),),
    );
  }

  double get totalOrderPrice {
    double sum = 0;
    bookings.forEach((val) => sum += val.price);
    return sum;
  }

  int val = 0;

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Color(0xffeeeeee),
            radius: 24.0,
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 32.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "${widget.provider.title}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (v) {},
                        starCount: 5,
                        rating: 3,
                        size: 24.0,
                        color: Colors.green,
                        borderColor: Colors.green,
                        spacing: 0.0),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PersonalServiceProviderProfileScreen(
                                serviceProvider: widget.provider,
                              )));
                    },
                    child: Text("View Profile"),
                    textColor: Colors.white,
                    color: Colors.green,
                    elevation: 0.0,
                    highlightElevation: 0.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTabBar() {
    List<String> options = ["Services", "Gallery", "Reviews"];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CupertinoSegmentedControl(
        children: options
            .map((item) => Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(item),
                ))
            .toList()
            .asMap(),
        onValueChanged: (val) {
          setState(() {
            this.val = val;
          });
        },
        groupValue: val,
      ),
    );
  }

  Widget buildReviews() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder(
        future: PersonalServiceController.getReviews(""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          List<ServiceProviderReview> reviews = snapshot.data;
          if (reviews != null) {
            return ListView.builder(
                itemBuilder: (context, index) => PersonalServiceProviderReviewWidget(
                      review: reviews[index],
                    ),
                shrinkWrap: true,
                itemCount: reviews.length);
          }
          return Center(
            child: Text("Not Found"),
          );
        },
      ),
    );
  }

  Widget buildServiceList() {
    return FutureBuilder(
      future: PersonalServiceController.getServices(""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data != null) {
          List<BookService> services = snapshot.data;
          List<Widget> children = [];
          Map<String, List<BookService>> serviceMap = {};
          services.forEach((val) {
            if (!serviceMap.containsKey(val.category)) {
              serviceMap[val.category] = [];
              children.add(Container(
                child: Text(
                  "${val.category}",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                      fontWeight: FontWeight.w500),
                ),
                color: Color(0xffeeeeee),
                padding: EdgeInsets.all(12.0),
              ));
            }
            children.add(BookServiceWidget(
              service: val,
              isBooked: bookings.contains(val),
              onAdded: (val, isAdded) {
                if (isAdded) {
                  val.noOfOrders=1;
                  bookings.add(val);
                } else {
                  val.noOfOrders=0;
                  bookings.remove(val);
                }
                setState(() {});
              },
            ));
            serviceMap[val.category].add(val);
          });
          return ListView.builder(
            itemBuilder: (context, index) => children[index],
            shrinkWrap: true,
            itemCount: children.length,
          );
        }
        return Text("Not Found");
      },
    );
  }

  Widget buildGallery() {
    return FutureBuilder(
      future: PersonalServiceController.getImages(''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null) {
          return Text("Nothing Found");
        }
        List<String> images = snapshot.data;
        return GridView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => GridTile(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                )));
      },
    );
  }
}
