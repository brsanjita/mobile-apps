import 'package:customer/models/personal_service/book_service.dart';
import 'package:customer/models/personal_service/personal_service.dart';
import 'package:customer/models/service_provider_review.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PersonalServiceController {
  static Future<List<ServiceProviderReview>> getReviews(String id) async {
    await Future.delayed(Duration(seconds: 1));
    return [
      ServiceProviderReview(
          provider: PersonalServiceProvider(
            position: LatLng(17.3616, 78.4747),
            icon: "assets/images/picker.png",
            id: "123",
            title: "Balamurali Pandranki",
          ),
          rating: 4)
    ];
  }

  static Future<List<BookService>> getServices(String id) async {
    return [
      BookService(
          title: "Apartment",
          id: "123",
          category: "Post Party Cleaning",
          isBooked: false,
          price: 50.0),
      BookService(
          title: "Bunglow",
          id: "124",
          category: "Post Party Cleaning",
          isBooked: false,
          price: 80.16),
      BookService(
          title: "Apartment",
          id: "125",
          category: "Office Cleaning",
          isBooked: false,
          price: 50.0),
    ];
  }

  static Future<List<String>> getImages(String id) async {
    await Future.delayed(Duration(seconds: 1));
    return [
      "https://secure.gravatar.com/avatar/06079b9dd890ce25855def48c6cbebf7?s=48&d=identicon",
      "https://secure.gravatar.com/avatar/06079b9dd890ce25855def48c6cbebf7?s=48&d=identicon"
    ];
  }

  static Future<List<PersonalServiceProvider>> getHomeCleaningServices() async {
    return [
      PersonalServiceProvider(
          title: "Home Cleaning",
          icon: "",
          id: "124",
          position: LatLng(28.0, 72.0)),
      PersonalServiceProvider(
          title: "Post Party Cleaning",
          icon: "",
          id: "125",
          position: LatLng(28.0, 72.0)),
      PersonalServiceProvider(
          title: "Office Cleaning",
          icon: "",
          id: "126",
          position: LatLng(28.0, 72.0)),
    ];
  }
  static Future<List<PersonalServiceProvider>> getCarWashServices() async {
    return [
      PersonalServiceProvider(
          title: "Hatchback",
          icon: "",
          id: "126",
          position: LatLng(28.0, 72.0)),
      PersonalServiceProvider(
          title: "Sedan",
          icon: "",
          id: "146",
          position: LatLng(28.0, 72.0)),
      PersonalServiceProvider(
          title: "SUV",
          icon: "",
          id: "157",
          position: LatLng(28.0, 72.0)),
    ];
  }
}
