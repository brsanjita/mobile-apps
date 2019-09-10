import 'package:customer/fragments/bookings.dart';
import 'package:customer/fragments/home_fragment.dart';
import 'package:customer/fragments/orders.dart';
import 'package:customer/fragments/profile.dart';
import 'package:common/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomBarCurrentIndex = 0;
  final List<Widget> _bottomBarChildren = [
    HomeFragment(),
    WalletScreen(),
    BookingsFragment(),
    OrdersFragment(),
    ProfileFragment(),
  ];

  void onBottomBarTabTapped(int index) {
    setState(() {
      _bottomBarCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomBarChildren[_bottomBarCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomBarCurrentIndex,
        onTap: onBottomBarTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Book'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_balance_wallet),
            title: new Text('Wallet'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: new Text('Bookings'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_basket),
            title: new Text('Orders'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Account')),
        ],
      ),
    );
  }
}
