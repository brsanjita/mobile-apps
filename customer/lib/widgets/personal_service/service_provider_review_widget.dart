import 'package:customer/models/service_provider_review.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class PersonalServiceProviderReviewWidget extends StatelessWidget {
  final ServiceProviderReview review;

  const PersonalServiceProviderReviewWidget({Key key, @required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 12.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              review.provider.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            )),
            SmoothStarRating(starCount: 5,rating: review.rating,color: Colors.green,)
          ],
        ),
      ),
    );
  }
}
