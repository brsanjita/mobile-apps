import 'package:common/models/user/mobile_number.dart';
import 'package:common/models/user/user.dart';
import 'package:common/screens/emergency_contacts/emergency_contacts.dart';
import 'package:common/screens/invite/invite_friends_screen.dart';
import 'package:common/screens/login/country_selection.dart';
import 'package:common/screens/login/login.dart';
import 'package:common/screens/login/login_email.dart';
import 'package:common/screens/login/mobile_login.dart';
import 'package:common/screens/login/otp_screen.dart';
import 'package:common/screens/login/signup_email.dart';
import 'package:common/screens/profile/profile.dart';
import 'package:common/screens/support/support.dart';
import 'package:common/screens/wallet/payments_screen.dart';
import 'package:common/screens/wallet/transaction_screen.dart';
import 'package:customer/fragments/profile.dart';
import 'package:customer/screens/appsettings.dart';
import 'package:customer/screens/book_delivery.dart';
import 'package:customer/screens/book_rentals.dart';
import 'package:customer/screens/book_service.dart';
import 'package:customer/screens/cab/book_cab_screen.dart';
import 'package:customer/screens/cab/cab_home.dart';
import 'package:customer/screens/cab/driver_screen.dart';
import 'package:customer/screens/cab/location_input_screen.dart';
import 'package:customer/screens/cab/cab_location_search_screen.dart';
import 'package:customer/screens/car_wash/car_wash_screen.dart';
import 'package:customer/screens/common_delivery/common_delivery_screen.dart';
import 'package:customer/screens/contacts_screen.dart';
import 'package:customer/screens/help.dart';
import 'package:customer/screens/home_screen.dart';
import 'package:customer/screens/home_cleaning/home_cleaning_screen.dart';
import 'package:customer/screens/notifications.dart';
import 'package:customer/screens/offers.dart';
import 'package:customer/screens/orders.dart';
import 'package:customer/screens/payment_screen.dart';
import 'package:customer/screens/personal_service/book_success_screen.dart';
import 'package:customer/screens/personal_service/personal_service_detail_screen.dart';
import 'package:customer/screens/personal_service/personal_service_order_screen.dart';
import 'package:customer/screens/personal_service/personal_service_screen.dart';
import 'package:customer/screens/personal_service/special_instruction_screen.dart';
import 'package:customer/screens/referral_screen.dart';
import 'package:customer/screens/restaurant/basket_add_screen.dart';
import 'package:customer/screens/restaurant/restaurant_cart_screen.dart';
import 'package:customer/screens/restaurant/restaurant_details_screen.dart';
import 'package:customer/screens/restaurant/restaurant_screen.dart';
import 'package:common/screens/splash/splash_screen.dart';
import 'package:customer/theme_colors.dart';
import 'package:common/utils/trusted_http.dart';
import 'package:common/common.dart' as common;
import 'package:customer/utils/personal_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await common.open();
  final HttpLink httpLink = HttpLink(
    uri: 'https://dev.graph.tribe.cab/graphql',
  );
  String token=await TrustedHttp.getToken();
  print("Main Token $token");
  final AuthLink authLink = AuthLink(
    getToken: () async => "Bearer ${token??''}",
  );

  final Link link = authLink.concat(httpLink as Link);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

  runApp(GraphQLProvider(
      client: client,
      child: CacheProvider(
          child: MaterialApp(
        title: 'Tribe',
        theme: TribeThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: <String, WidgetBuilder>{
          '/splash':(context)=>SplashScreen(),
          '/': (BuildContext context) => new HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/restaurant': (context) => RestaurantScreen(),
          '/mobileLogin': (context) => MobileLoginScreen(),
          '/otp': (context) => OTPScreen(),
          '/countrySelection': (context) => CountrySelectionScreen(),
          '/signUpEmail': (context) => SignUpScreen(),
          '/loginEmail': (context) => LoginEmailScreen(),
          '/payment': (context) => PaymentScreen(),
          '/locationSearch': (context) => CabLocationSearchScreen(),
          '/notifications': (BuildContext context) => new NotificationsScreen(),
          '/resetpassword': (BuildContext context) => new HomeScreen(),
          '/accountsettings': (BuildContext context) => new ProfileFragment(),
          '/homeCleaning': (context) => HomeCleaningScreen(),
          '/carWash':(context)=>CarWashScreen(),
          '/service':(context)=> PersonalServiceScreen(future: PersonalServiceController.getHomeCleaningServices(),),
          '/serviceOrder': (context) => PersonalServiceOrderScreen(),
          '/serviceDetail': (context) => PersonalServiceDetailScreen(),
          '/specialInstruction': (context) => SpecialInstructionScreen(),
          '/bookCab': (BuildContext context) => new TaxiHomeScreen(),
          '/restaurant': (context) => RestaurantScreen(),
          '/restaurantDetails': (context) => RestaurantDetailsScreen(),
          '/basketAdd': (context) => BasketAddScreen(),
          '/restaurantCart': (context) => RestaurantCartScreen(),
          '/taxi': (BuildContext context) => new BookCabScreen(
                from: null,
                to: null,
              ),
          '/driverScreen': (BuildContext context) => new DriverScreen(),
          '/locationInputScreen': (BuildContext context) =>
              LocationInputScreen(),
          '/bookservice': (BuildContext context) => new BookServiceScreen(),
          '/bookrental': (BuildContext context) => new BookRentalScreen(),
          '/bookdelivery': (BuildContext context) => new BookDeliveryScreen(),
          '/bookSuccess': (context) => BookSuccessScreen(),
          '/help': (BuildContext context) => new HelpScreen(),
          '/contacts': (BuildContext context) => ContactsScreen(),
          '/manageProfile': (context) => ProfileScreen(
                user: User.named(
                    firstName: "",
                    currency: "",
                    email: "",
                    countryCode: "",
                    language: "",
                    lastName: "",
                    mobileNo: MobileNumber(countryCode: "IN", number: "")),
              ),
          '/emergencyContacts': (BuildContext context) =>
              new EmergencyContactsScreen(),
          '/referrals': (BuildContext context) => new ReferralScreen(),
          '/inviteFriends': (context) => InviteFriendScreen(),
          '/paymentMethods': (context) => PaymentMethodsScreen(),
          '/offers': (BuildContext context) => new OffersScreen(),
          '/support': (context) => SupportScreen(),
          '/manageaddress': (BuildContext context) => new ManageAddressScreen(),
          '/appsettings': (BuildContext context) => new AppSettingsScreen(),
          '/orderdetails': (BuildContext context) => new OrderDetailsScreen(),
          '/orderstatus': (BuildContext context) => new OrderStatusScreen(),
          '/walletTransactions': (context) => WalletTransactionScreen(),
          '/commonDelivery':(context)=>CommonDeliveryScreen()
        },
      ))));
}
