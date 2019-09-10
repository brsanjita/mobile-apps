
enum CreditCardType{
  Visa,Master_Card,Rupay
}

class CreditCard{
  String _cardNumber;
  CreditCardType _type;

  CreditCard(this._cardNumber, this._type):
      assert(_cardNumber.length==16);

  String get cardNumber{
    List<String>group=[];
    for(int i=0;i<4;i++){
      group.add(_cardNumber.split('').skip(i*4).take(4).join(''));
    }
    return '${group[0]}-XXXXXXXX-${group[3]}';
  }
  String get icon{
    if(_type==CreditCardType.Visa){
      return "https://spng.pngfly.com/20180719/ghr/kisspng-logo-brand-visa-font-visa-logo-5b5026e2c04f22.4004029915319794907877.jpg";
    }
    else if(_type==CreditCardType.Master_Card){
      return "https://spng.pngfly.com/20180612/hri/kisspng-mastercard-credit-card-business-debit-card-logo-mastercard-5b1fe1af05c944.0935314615288160470237.jpg";
    }
    else if(_type==CreditCardType.Rupay){
      return "https://spng.pngfly.com/20180713/yok/kisspng-india-rupay-debit-card-bank-credit-card-italy-visa-5b487f3c61e152.1595798015314778204009.jpg";
    }
  }
}