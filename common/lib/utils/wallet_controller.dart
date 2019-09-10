
import 'package:common/models/wallet/card.dart';
import 'package:common/models/wallet/wallet.dart';
import 'package:common/models/wallet/wallet_transcation.dart';

class WalletController {
  static List<Wallet> getWallets() {
    return [
      Wallet(
          "https://spng.pngfly.com/20180810/rvj/kisspng-paytm-logo-brand-service-product-funding-archives-letusdiscuss-com-5b6d3959b4cf91.8180523315338847617406.jpg",
          "PayTm",
          0.0,
          true),
      Wallet(
          "https://spng.pngfly.com/20180615/fc/kisspng-freecharge-gurugram-mobile-phones-payment-customer-sbi-mutual-fund-5b240e3431bf13.5858008615290895882038.jpg",
          "FreeCharge",
          0.0,
          false),
      Wallet(
          "https://spng.pngfly.com/20180615/fc/kisspng-freecharge-gurugram-mobile-phones-payment-customer-sbi-mutual-fund-5b240e3431bf13.5858008615290895882038.jpg",
          "Mobikwik",
          0.0,
          false),
      Wallet(
          "https://spng.pngfly.com/20180623/liv/kisspng-phonepe-india-unified-payments-interface-5b2f16774a1520.1189984415298125993035.jpg",
          "PhonePe",
          10.0,
          true),
    ];
  }
  static List<CreditCard> getCards(){
    return [
      CreditCard("1234567891234567", CreditCardType.Visa),
      CreditCard("4321567891237654", CreditCardType.Master_Card),
    ];
  }
  static Future<List<WalletTransaction>> getTransactions()async{
    return [
      WalletTransaction.named(amount: 100.0,debited: true,orderName: "ORDER1221851510",processedAt: DateTime.now(),status: "Order Succesful",success: true,transactionId: "16522990025"),
      WalletTransaction.named(amount: 250.0,debited: false,orderName: "ORDER1221851515",processedAt: DateTime.now(),status: "Order Succesful",success: true,transactionId: "16515299002"),
      WalletTransaction.named(amount: 175.0,debited: false,orderName: "ORDER1221854551",processedAt: DateTime.now(),status: "Zomato",success: false,transactionId: "16515990025"),
    ];
  }
}
