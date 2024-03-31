import 'package:dughri/controller/select_way/select_way_controller.dart';
import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'Widget/custom_tab.dart';
import 'Widget/custom_way_tabview.dart';

class SelectWayTOGo extends StatefulWidget {
  const SelectWayTOGo({super.key, required this.numberOfGuests});

  final int numberOfGuests;

  @override
  State<SelectWayTOGo> createState() => _SelectWayTOGoState();
}

class _SelectWayTOGoState extends State<SelectWayTOGo> {
  @override
  Widget build(BuildContext context) {
    SelectWayController controller = Get.put(SelectWayController());
    controller.numberOfGuests = numberOfGuests;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142968),
        title: Text("Select Way To Go" ,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (SelectWayController controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : DefaultTabController(
                length: 4, // The number of tabs
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 4.w,
                      indicatorColor: const Color(0xffF46B6B),
                      labelColor: const Color(0xff45507B),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        CustomTab(
                          title: "Train" ,
                          price: controller.availableWays['train']!.isEmpty
                              ? "none" 
                              : "${controller.availableWays['train']![0].price}",
                          icon: Icons.train,
                          duration: controller.availableWays['train']!.isEmpty
                              ? "none" 
                              : controller.availableWays['train']![0].time,
                          available:
                              controller.availableWays['train']?.isEmpty == null
                                  ? false
                                  : true,
                        ),
                        CustomTab(
                          title: "Bus" ,
                          price: controller.availableWays['bus']!.isEmpty
                              ? "none" 
                              : "${controller.availableWays['bus']![0].price}",
                          icon: FontAwesomeIcons.bus,
                          duration: controller.availableWays['bus']!.isEmpty
                              ? "none" 
                              : controller.availableWays['bus']![0].time,
                          available:
                              controller.availableWays['bus']?.isEmpty == null
                                  ? false
                                  : true,
                        ),
                        CustomTab(
                          title: "Metro" ,
                          price: controller.availableWays['metro']!.isEmpty
                              ? "none" 
                              : "${controller.availableWays['metro']![0].price}",
                          icon: FontAwesomeIcons.trainSubway,
                          duration: controller.availableWays['metro']!.isEmpty
                              ? "none" 
                              : controller.availableWays['metro']![0].time,
                          available:
                              controller.availableWays['metro']?.isEmpty == null
                                  ? false
                                  : true,
                        ),
                        CustomTab(
                          title: "Monorail" ,
                          price: controller.availableWays['monorail']!.isEmpty
                              ? "none" 
                              : "${controller.availableWays['monorail']![0].price}",
                          icon: FontAwesomeIcons.trainTram,
                          duration: controller
                                  .availableWays['monorail']!.isEmpty
                              ? "none" 
                              : controller.availableWays['monorail']![0].time,
                          available:
                              controller.availableWays['monorail']?.isEmpty ==
                                      null
                                  ? false
                                  : true,
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          CustomWayTabView(
                            data: controller.availableWays['train']!,
                          ),
                          CustomWayTabView(
                            data: controller.availableWays['bus']!,
                          ),
                          CustomWayTabView(
                            data: controller.availableWays['metro']!,
                          ),
                          CustomWayTabView(
                            data: controller.availableWays['monorail']!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

