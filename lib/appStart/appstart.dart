import 'package:delivery_app/screen/deliveryScreen.dart';
import 'package:delivery_app/screen/home.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/screen/signout.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screen/pickup/PickupScreen.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  int _selectedIndex = 0;
  final List<Widget> screen = [
    HomeScreen(),
    PickupScreen(),
    DeliveryScreen(),
    ProfileScreen(),
    // SignOutScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        // color: Colors.black,
        child: GNav(
            gap: 8,
            padding: EdgeInsets.all(16),
            backgroundColor: Constants.blue,
            color: Colors.white,
            activeColor: Constants.red,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            // tabBackgroundColor: Colors.grey.shade700,
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 30,
                // text: "Home",
              ),
              GButton(
                icon: Icons.card_giftcard,
                iconSize: 30,
                // text: "History",
              ),
              GButton(
                icon: Icons.delivery_dining,
                iconSize: 30,
                // text: "Search",
              ),
              GButton(
                icon: Icons.person,
                iconSize: 30,
                // text: "Setting",
              ),
              // GButton(
              //   icon: Icons.exit_to_app,
              //   iconSize: 30,
              //   // text: "Setting",
              // )
            ]),
      ),
    );
  }
}
