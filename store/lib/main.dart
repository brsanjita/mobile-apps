import 'package:common/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:store/screens/bank/bank_account_settings.dart';
import 'package:store/screens/bank/bank_details_screen.dart';
import 'package:store/screens/bank/bank_instructions_screen.dart';
import 'package:store/screens/bank/bank_review_screen.dart';
import 'package:store/screens/bank/bank_upload_screen.dart';
import 'package:store/screens/bank_settings.dart';
import 'package:store/screens/earnings.dart';
import 'package:store/screens/edit_profile.dart';
import 'package:store/screens/email_login.dart';
import 'package:store/screens/forgot_password.dart';
import 'package:store/screens/home.dart';
import 'package:store/screens/notifications.dart';
import 'package:store/screens/order_details.dart';
import 'package:store/screens/order_statistics.dart';
import 'package:store/screens/profile.dart';
import 'package:store/screens/set_timings.dart';
import 'package:store/screens/settings_screen.dart';
import 'package:store/screens/signup.dart';
import 'package:store/screens/store_details.dart';
import 'package:store/screens/store_documents.dart';
import 'package:store/screens/store_menu.dart';
import 'package:store/screens/support.dart';
import 'package:store/screens/upload_screen.dart';
import 'package:store/theme_colors.dart';
import 'package:common/screens/login/login.dart';
import 'package:common/common.dart' as common;

void main() async{
  common.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tribe Store',
      theme: ThemeData(
          primarySwatch: TribeColors.black,
          primaryColor: Colors.green,
          appBarTheme: AppBarTheme(color: Colors.black)),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => HomeScreen(title: "Orders"),
        "/login": (BuildContext context) => LoginScreen(),
        "/bankAccountSettings": (BuildContext context) =>
            AccountSettingsScreen(),
        '/bankDetails': (BuildContext context) => BankDetailsScreen(),
        '/bankUpload': (context) => BankUploadScreen(),
        '/bankReview': (context) => BankReviewScreen(),
        '/bankInstructions': (context) => BankInstructionsScreen(),
        "/orderdetails": (BuildContext context) => OrderDetailsScreen(),
        "/earnings": (BuildContext context) => EarningsScreen(),
        '/emailLogin': (context) => EmailLoginScreen(),
        "/signup": (BuildContext context) => SignupScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        "/bankdetails": (BuildContext context) => BankSettingsScreen(),
        "/storemenu": (BuildContext context) => StoreMenuScreen(),
        "/uploaddocuments": (BuildContext context) => UploadDocumentScreen(),
        "/storedocuments": (BuildContext context) => StoreDocumentsScreen(),
        "/orderstatistics": (BuildContext context) => OrderStatisticsScreen(),
        "/support": (BuildContext context) => SupportScreen(),
        "/profile": (BuildContext context) => ProfileScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        "/notifications": (BuildContext context) => NotificationsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/storeDetails': (context) => StoreDetailsScreen(),
        '/setTimings': (context) => SetTimingsScreen()
      },
    );
  }
}
