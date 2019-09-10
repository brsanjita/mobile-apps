

class MobileNumber{
  final String number;
  final String countryCode;

  MobileNumber({this.number, this.countryCode});

  @override
  String toString() {
    return "+$countryCode$number";
  }

  factory MobileNumber.fromJson(mobileNumber){
    if(mobileNumber==null||!(mobileNumber is String)){
      return null;
    }
    String countryCode=mobileNumber.toString().substring(1,3);
    String number=mobileNumber.toString().substring(3);
    return MobileNumber(number: number,countryCode: countryCode);
  }
}