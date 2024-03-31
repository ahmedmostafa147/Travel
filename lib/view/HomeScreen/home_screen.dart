import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/core/Service/cloud_firestore/firestore_service.dart';
import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/view/HomeScreen/Widget/custom_container_text_field.dart';
import 'package:dughri/view/HomeScreen/Widget/list_places_stay.dart';
import 'package:dughri/view/HomeScreen/Widget/need_a_place_location.dart';
import 'package:dughri/view/HomeScreen/Widget/search/search_src_location.dart';
import 'package:dughri/view/HomeScreen/Widget/search/search_dest_location.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/search_page_select_train_bus_metro.dart';
import 'package:dughri/widget/CustomMaterialButtom/custom_material.dart';
import 'package:dughri/widget/Date%20Picker/data_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

int numberOfGuests = 1;
DateTime? startDate;
DateTime? endDate;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeScreen> {
  // Location location = Location();
  String srcLocationHint = "City, station or airport";
  String destLocationHint = "City, station or airport";
  List hotels = [];
  bool isLoading = true;
  @override
  void initState() {
    _loadLocationFromStorage();
    _loadDateRangeFromStorage();
    getAvailableHotels();
    super.initState();
  }

  Future _loadLocationFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      srcLocationHint = prefs.getString('from') ?? "City, station or airport";
      destLocationHint = prefs.getString('to') ?? "City, station or airport";
      print(srcLocationHint);
    });
  }

  Future<void> _loadDateRangeFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve start date
    String? startDateString = prefs.getString('startDate');
    if (startDateString != null && startDateString.isNotEmpty) {
      setState(() {
        startDate = DateFormat("dd/MM/yy").parse(startDateString);
      });
    }

    // Retrieve end date
    String? endDateString = prefs.getString('endDate');
    if (endDateString != null && endDateString.isNotEmpty) {
      setState(() {
        endDate = DateFormat("dd/MM/yy").parse(endDateString);
      });
    }
  }

  void getAvailableHotels() async {
    final prefs = await SharedPreferences.getInstance();
    hotels =
        await CloudFirestoreService().getHotels(prefs.getString("to") ?? "");
    setState(() {
      isLoading = false;
    });
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
                              Get.to(() => const SearchSrcLocationField());
                            },
                            child: CustomContainerTextField(
                                hintText: srcLocationHint,
                                iconData: FontAwesomeIcons.locationCrosshairs),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SearchDestLocationField());
                            },
                            child: CustomContainerTextField(
                                hintText: destLocationHint,
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
                              _showSliderDialog(context);
                            },
                            child: CustomContainerTextField(
                                hintText: numberOfGuests.toString(),
                                iconData: FontAwesomeIcons.user),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 7),
                  child: CustomMaterialButton(
                    onPressed: () {
                      Get.to(
                        () => SelectWayTOGo(
                          numberOfGuests: numberOfGuests,
                        ),
                      );
                    },
                    buttonText: 'Search DOغRY',
                  ),
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : hotels.isNotEmpty
                        ? Column(children: [
                            NeedPlaceTextWithLocation(
                              destination: destLocationHint,
                            ),
                            ListPlacesToStay(
                              hotels: hotels,
                            ),
                          ])
                        : const SizedBox()
              ])
        ],
      ),
    );
  }

  void _showSliderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SliderDialog(
          onSelected: (value) {
            setState(() {
              numberOfGuests = value;
            });
          },
        );
      },
    );
  }
}

class SliderDialog extends StatefulWidget {
  const SliderDialog({super.key, required this.onSelected});

  final Function(int) onSelected;
  @override
  _SliderDialogState createState() => _SliderDialogState();
}

class _SliderDialogState extends State<SliderDialog> {
  int selectedValue = 4; // Initial value

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select a Number',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Slider(
            value: selectedValue.toDouble(),
            min: 1,
            max: 20,
            onChanged: (double value) {
              setState(() {
                selectedValue = value.round();
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            '${"Number of guest is :"} $selectedValue',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.onSelected(selectedValue);
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
