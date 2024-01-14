import 'package:dughri/core/constant/Images_Path.dart';
import 'package:dughri/core/Service/Location/location_sevice.dart';
import 'package:dughri/view/HomeScreen/Widget/Search_location_field.dart';
import 'package:dughri/view/HomeScreen/Widget/custom_container_text_field.dart';
import 'package:dughri/view/HomeScreen/Widget/list_places_stay.dart';
import 'package:dughri/view/HomeScreen/Widget/need_a_place_location.dart';
import 'package:dughri/view/HomeScreen/Widget/select_numder_guests.dart';
import 'package:dughri/view/Search_page_to_select_fly_train_metro.dart/search_page_select_fly_train_metro.dart';
import 'package:dughri/widget/Custom_Material_Buttom/custom_material.dart';
import 'package:dughri/widget/Date%20Picker/data_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String currentLocationHint = "City, station or airport";
double latitude = 30.007413;
double longitude = 31.4913182;
DateTime? startDate;
DateTime? endDate;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeScreen> {
  Location location = Location();

  @override
  void initState() {
    _loadLocationFromStorage();
    _loadDateRangeFromStorage();
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

  Future<void> _loadDateRangeFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve start date
    String? startDateString = prefs.getString('startDate');
    if (startDateString != null && startDateString.isNotEmpty) {
      setState(() {
        startDate = DateTime.parse(startDateString);
      });
    }

    // Retrieve end date
    String? endDateString = prefs.getString('endDate');
    if (endDateString != null && endDateString.isNotEmpty) {
      setState(() {
        endDate = DateTime.parse(endDateString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
          ListView(
              physics: const BouncingScrollPhysics(),
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: true,
              children: [
                SizedBox(height: 150.h),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("Where to?",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SearchLocationField());
                            },
                            child: CustomContainerTextField(
                                hintText: currentLocationHint,
                                iconData: FontAwesomeIcons.locationCrosshairs),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SearchLocationField());
                            },
                            child: CustomContainerTextField(
                                hintText: currentLocationHint,
                                iconData: FontAwesomeIcons.locationDot),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const ShowDatePicker());
                                },
                                child: CustomContainerTextField(
                                    width: 166.w,
                                    hintText: startDate == null
                                        ? "From"
                                        : DateFormat('dd/MM/yyyy')
                                            .format(startDate!),
                                    iconData: (FontAwesomeIcons.calendar)),
                              ),
                              CustomContainerTextField(
                                  width: 166.w,
                                  hintText: endDate == null
                                      ? "To"
                                      : DateFormat('dd/MM/yyyy')
                                          .format(endDate!),
                                  iconData: FontAwesomeIcons.calendar),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SelectNumberGuests());
                            },
                            child: const CustomContainerTextField(
                                hintText: "Select number of guests",
                                iconData: FontAwesomeIcons.user),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 7),
                  child: CustomMaterialButton(
                    onPressed: () {
                      Get.to(() => const SelectWayTOGo());
                    },
                    buttonText: 'Search DOغRY',
                  ),
                ),
                const NeedPlaceTextWithLocation(),
                const Divider(
                  color: Colors.grey,
                ),
                const ListPlacesToStay(),
              ])
        ],
      ),
    );
  }
}
