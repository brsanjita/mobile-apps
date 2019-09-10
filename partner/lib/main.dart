import 'package:common/screens/bank/bank_account_settings.dart';
import 'package:common/screens/bank/bank_details_screen.dart';
import 'package:common/screens/login/login.dart';
import 'package:common/screens/login/signup_email.dart';
import 'package:common/screens/splash/splash_screen.dart';
import 'package:common/utils/trusted_http.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:partner/screens/email_login.dart';
import 'package:partner/screens/forgot_password.dart';
import 'package:partner/screens/home.dart';
import 'package:partner/screens/waiting_screen.dart';
import 'package:partner/theme_colors.dart';
import 'package:common/common.dart' as common;

void main() async {
  await common.open();
  final HttpLink httpLink = HttpLink(
    uri: 'https://dev.graph.tribe.cab/graphql',
  );
  String token=await TrustedHttp.getToken();
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${token??''}',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink as Link);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
  runApp(GraphQLProvider(client: client, child: CacheProvider(child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tribe Partner',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white)),
        primarySwatch: TribeColors.black,
      ),
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => HomeScreen(),
        '/splash':(context)=>SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/emailLogin': (context) => EmailLoginScreen(),
        "/signup": (BuildContext context) => SignUpScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/bankDetails': (context) => BankAccountSettingScreen(),
        '/waiting': (context) => WaitingScreen()
      },
    );
  }
}
