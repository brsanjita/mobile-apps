
import 'package:common/models/user/mobile_number.dart';

class User {
  String id;
  DateTime createdAt ;
  DateTime updatedAt;
  String firstName;
  String lastName ;
  String email ;
  MobileNumber mobileNo ;
  String state ;
  String city ;
  bool isActive ;
  bool isMobileVerified ;
  bool isEmailVerified ;
  bool isLocked ;
  String gender ;
  DateTime dateOfBirth ;
  String referralCode ;
  String language;
  String currency;
  String countryCode;


  User(this.id, this.createdAt, this.updatedAt, this.firstName, this.lastName,
      this.email, this.mobileNo, this.state, this.city, this.isActive,
      this.isMobileVerified, this.isEmailVerified, this.isLocked, this.gender,
      this.dateOfBirth, this.referralCode, this.language, this.currency,
      this.countryCode);

  User.named({
    this.id, this.createdAt, this.updatedAt, this.firstName, this.lastName,
    this.email, this.mobileNo, this.state, this.city, this.isActive,
    this.isMobileVerified, this.isEmailVerified, this.isLocked, this.gender,
    this.dateOfBirth, this.referralCode, this.language, this.currency,
    this.countryCode});

}