import 'dart:convert';

import 'package:customer/models/country.dart';
import 'package:customer/models/map_location.dart';
import 'package:customer/utils/remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:common/utils/trusted_http.dart';

class SearchController {
  //Get Location
  static const String apiKey = "AIzaSyDUvdeaVmI37kTsButAN_mZJfbIuTn0I6M";
  static const String geoLocationUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?";

  static Future<List<MapLocation>> searchLocation(String query) async {
    if (query == null || query.length == 0) {
      return [];
    }
    String url = geoLocationUrl +
        "key=$apiKey" +
        "&" +
        "input=$query" +
        "&components=country:in&sensor=false";
    print("URL : $url");
    http.Response response = await http.get(url);
    print("Body ${response.body}");
    var json = jsonDecode(response.body);
    print("Predictions ${json['predictions']}");
    if (json["predictions"] != null) {
      var list =
          List<MapLocation>.from(List.from(json['predictions']).map((item) {
        return MapLocation.fromJson(item["structured_formatting"]);
      }).toList());
      return list;
    }
    return [];
  }

  static Future<List<MapLocation>> getRecentSearches() async {
    await Future.delayed(Duration(seconds: 1));
    return [MapLocation("Bangalore", "Bangalore", "")];
  }

  static Future<List<Country>> getCountries() async {
    String query = '''
                   query{
                     countries{
                       totalCount
                       nodes{
                        id
                        countryName
                        phoneCode
                       }
                     }
                   }
                                     ''';
    TrustedHttp trustedHttp=TrustedHttp();
    http.Response response=await trustedHttp.post(RemoteConfig.BASE_URL,body: jsonEncode({"query":query}));
    var json=jsonDecode(response.body);
     if(json["data"]==null){
      return [];
    }
    var countries=json["data"]["countries"];
    return List<Country>.from(countries["nodes"].map((item)=>Country.fromJson(item)).toList());
  }
}
