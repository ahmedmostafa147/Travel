import 'package:dughri/view/Booking/booking.dart';
import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:dughri/view/LoginScreen/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({super.key});

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() => [
        const HomeScreen(),
        const BookingHistoryOrArchived(),
        const LoginScreen()
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.search,
            size: 30.r,
          ),
          activeColorPrimary: const Color.fromARGB(251, 251, 107, 108),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            FontAwesomeIcons.ticket,
            size: 30.r,
          ),
          activeColorPrimary: const Color.fromARGB(251, 251, 107, 108),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person,
            size: 30.r,
          ),
          activeColorPrimary: const Color.fromARGB(251, 251, 107, 108),
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 40.h,
      bottomScreenMargin: 40.h,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInCirc,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle:
          NavBarStyle.style5 // Choose the nav bar style with this property
      );
}
