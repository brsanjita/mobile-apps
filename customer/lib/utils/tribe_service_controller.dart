

import 'package:customer/models/tribe_service/tribe_service.dart';

class TribeServiceController{

  static List<TribeService> parseResponse(body){
    if(body!=null){
        if(body["services"]!=null){
          var services=body["services"];
          if(services!=null){
            var edges=services["edges"];
            if(edges!=null){
              return List<TribeService>.from(edges.map((val)=>TribeService.fromJson(val["node"])));
            }
          }
        }
    }
    return [];
  }

}