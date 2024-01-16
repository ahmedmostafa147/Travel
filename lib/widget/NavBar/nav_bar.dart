import 'package:dughri/view/Auth/Login/LoginView.dart';
import 'package:dughri/view/Auth/Register/RegisterView.dart';
import 'package:dughri/view/Booking/booking.dart';
import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:dughri/view/Auth/LoginScreen/login_screen.dart';
import 'package:dughri/view/Profile/pages/profile_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() => [
        const HomeScreen(),
        const BookingHistoryOrArchived(),
        ProfilePage(),
        const RegisterView(),
        const LoginView(),
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
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person,
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
      navBarStyle: NavBarStyle.style5);
}
