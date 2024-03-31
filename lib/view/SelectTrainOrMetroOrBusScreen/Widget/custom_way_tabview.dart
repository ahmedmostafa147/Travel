import 'package:dughri/controller/select_way/select_way_controller.dart';
import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/core/constant/texts.dart';
import 'package:dughri/models/way.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/custom_filter_chip_list.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/details.dart';
import 'package:dughri/widget/custom_dialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomWayTabView extends StatefulWidget {
  const CustomWayTabView({super.key, required this.data});
  final List data;

  @override
  State<CustomWayTabView> createState() => _CustomWayTabViewState();
}

class _CustomWayTabViewState extends State<CustomWayTabView> {
  final controller = SelectWayController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: CustomFilterChipList(
                    filterOptions: ['Price', 'Departure Time', 'Stops'],
                    onSelected: (selectedOption) {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: widget.data
                  .map((way) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomizableTicketContainer(
                          onTap: () {
                            checkTicketAvailability(way);
                          },
                          logoImagePath: Assets.imagesCompanylogo,
                          trainNumber: way.id,
                          departureTime: way.depTime,
                          departureCity: way.from,
                          duration: way.time,
                          arrivalTime: way.arrivTime,
                          arrivalCity: way.to,
                          price:
                              "${kPriceType} ${(way.price * controller.numberOfGuests)}",
                          travelType: controller.numberOfGuests.toString(),
                          transfers: 'Transfers',
                          availability: 'Limited availability',
                          showQrCode: false,
                          availableTickets: way.avTickets,
                          way: way,
                        ),
                      ))
                  .toList(),
            ),
          ]),
        ),
      ),
    );
  }

  void checkTicketAvailability(Way way) {
    controller.selectedWay = way;
    if (way.avTickets < controller.numberOfGuests || way.avTickets == 0) {
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
          title: "No Tickets available",
          content: "${"the number of available tickets is"} ${way.avTickets}",
        ),
      );
    } else {
      Get.to(
        () => TrainDetails(
          way: way,
          numberOfGuests: controller.numberOfGuests,
        ),
      );
    }
  }
}
