import 'package:customer/models/personal_service/personal_service.dart';
import 'package:customer/screens/personal_service/personal_service_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PersonalServiceProviderWidget extends StatefulWidget {
  final PersonalServiceProvider provider;

  const PersonalServiceProviderWidget({Key key, @required this.provider})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalServiceProviderWidgetState();
}

class _PersonalServiceProviderWidgetState extends State<PersonalServiceProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PersonalServiceDetailScreen(
                  provider: widget.provider,
                )));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xffeeeeee),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
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
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "0.01 km away",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SmoothStarRating(
                            allowHalfRating: false,
                            onRatingChanged: (v) {},
                            starCount: 5,
                            rating: 4,
                            size: 18.0,
                            color: Colors.green,
                            borderColor: Colors.green,
                            spacing: 0.0),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
