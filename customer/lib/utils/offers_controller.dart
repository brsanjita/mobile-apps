
import 'package:customer/models/offer/offer.dart';

class OffersController{

  static Future<List<Offer>> getOffers()async{
    return [
      Offer.named(promoCode: "XF9E38",discount: 10.0),
      Offer.named(promoCode: "XF9E38",discount: 15.0),
      Offer.named(promoCode: "XF9E38",discount: 12.0),
      Offer.named(promoCode: "XF9E38",discount: 11.0),
      Offer.named(promoCode: "XF9E38",discount: 10.0),
    ];
  }

}