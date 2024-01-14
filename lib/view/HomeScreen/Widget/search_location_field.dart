import 'package:dughri/core/Service/Location/location_sevice.dart';
import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:dughri/widget/NavBar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dughri/widget/AppBar/custom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchLocationField extends StatefulWidget {
  const SearchLocationField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchLocationField> createState() => _SearchLocationFieldState();
}

class _SearchLocationFieldState extends State<SearchLocationField> {
  Location location = Location();

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

  Future getCurrentLocation() async {
    Map<String, dynamic>? location = await Location.getCurrentPosition();
    if (location != null) {
      setState(() {
        currentLocationHint = location['address'];
        latitude = location['latitude'];
        longitude = location['longitude'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Search Location",
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(192, 241, 242, 246)
              ),
              child: const TextField(
                // Set background color to grey
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical:
                          10.0), // Adjust the vertical padding to make TextField smaller

                  hintText: "City, station or airport",
                  prefixIcon: Icon(Icons.location_searching),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () async {
                await Location.getCurrentPosition();
                setState(() {
                  currentLocationHint;
                  Get.to(() => const ProvidedStylesExample());
                });
              },
              child:  Card(
                elevation: 1,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.locationArrow,color: Colors.orange,),
                      SizedBox(width: 10.w),
                      const Text("Use current location",style: TextStyle(color: Colors.orange),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
