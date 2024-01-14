import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NeedPlaceTextWithLocation extends StatefulWidget {
  const NeedPlaceTextWithLocation({super.key});

  @override
  State<NeedPlaceTextWithLocation> createState() =>
      _NeedPlaceTextWithLocationState();
}

class _NeedPlaceTextWithLocationState extends State<NeedPlaceTextWithLocation> {
  @override
  void initState() {
    _loadLocationFromStorage();
    super.initState();
  }

  Future _loadLocationFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? latitude1 = prefs.getDouble('latitude');
    double? longitude1 = prefs.getDouble('longitude');
    if (latitude1 != null && longitude1 != null) {
      setState(() {
        currentLocationHint = prefs.getString('address')!;
        latitude = latitude1;
        longitude = longitude1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Need a Place to stay in $currentLocationHint?",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
    );
  }
}
