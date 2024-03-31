import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/core/Service/Location/location_sevice.dart';
import 'package:dughri/core/Service/cloud_firestore/firestore_service.dart';
import 'package:dughri/view/HomeScreen/Widget/custom_card.dart';
import 'package:dughri/widget/NavBar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dughri/widget/AppBar/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDestLocationField extends StatefulWidget {
  const SearchDestLocationField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchDestLocationField> createState() =>
      _SearchDestLocationFieldState();
}

class _SearchDestLocationFieldState extends State<SearchDestLocationField> {
  Location location = Location();
  late CloudFirestoreService service;
  bool isSearchActive = false;
  var documents = [];
  var searchResult = [];

  @override
  void initState() {
    // _loadLocationFromStorage();
    service = CloudFirestoreService();
    super.initState();
  }

  // Future _loadLocationFromStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   double? latitude1 = prefs.getDouble('destLatitude');
  //   double? longitude1 = prefs.getDouble('destLongitude');

  //   if (latitude1 != null && longitude1 != null) {
  //     setState(() {
  //       destLocationHint = prefs.getString('destAddress')!;
  //       destLatitude = latitude1;
  //       destLongitude = longitude1;
  //     });
  //   }
  // }

  void applyLocation(String to) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("to", to);
    Get.offAll(() => const NavBar());
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
                  color: const Color.fromARGB(192, 241, 242, 246)),
              child: TextField(
                // Set background color to grey
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical:
                          10.0), // Adjust the vertical padding to make TextField smaller
                  hintText: "City, station or airport",
                  prefixIcon: const Icon(Icons.location_searching),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    isSearchActive = true;
                    setState(() {
                      searchResult = documents.where((to) {
                        return to.toLowerCase().contains(value.toLowerCase());
                      }).toList();
                    });
                  } else {
                    setState(() {
                      isSearchActive = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 10.h),
            //? search result
            isSearchActive
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                            onTap: () {
                              applyLocation(searchResult[index]);
                            },
                            title: searchResult[index]);
                      },
                    ),
                  )
                : StreamBuilder(
                    stream: service.getWays("to"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          snapshot.connectionState == ConnectionState.none) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error fetching data: ${snapshot.data}');
                      } else if (!snapshot.hasData &&
                          snapshot.data?.docs.isEmpty == true) {
                        return Center(child: Text('No data'));
                      }
                      documents = snapshot.data!.docs;
                      documents = removeRepeated(documents);
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            return CustomCard(
                                onTap: () async {
                                  applyLocation(documents[index]);
                                },
                                title: documents[index]);
                          },
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }
}

List removeRepeated(documents) {
  Set uniqueData = {};
  documents.forEach((way) => uniqueData.add(way['to']));
  return uniqueData.toList();
}
