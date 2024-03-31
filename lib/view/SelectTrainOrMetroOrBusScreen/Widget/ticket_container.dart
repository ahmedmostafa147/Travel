import 'package:dughri/controller/select_way/select_way_controller.dart';
import 'package:dughri/models/way.dart';
import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/details.dart';
import 'package:dughri/widget/CustomMaterialButtom/custom_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomizableTicketContainer extends StatelessWidget {
  final String logoImagePath;
  final String trainNumber;
  final String departureTime;
  final String departureCity;
  final String duration;
  final String arrivalTime;
  final String arrivalCity;
  final String price;
  final String travelType;
  final String transfers;
  final String availability;
  final bool showQrCode;
  final Way? way;
  final VoidCallback? onTap;
  final bool enableCancel;
  final VoidCallback? cancelOnPressed;
  final String? discount;
  final int? availableTickets;

  const CustomizableTicketContainer(
      {super.key,
      required this.logoImagePath,
      required this.departureTime,
      required this.departureCity,
      required this.duration,
      required this.arrivalTime,
      required this.arrivalCity,
      required this.price,
    
      required this.availability,
      required this.showQrCode,
      this.enableCancel = false,
      this.cancelOnPressed,
      this.way,
      this.discount,
      this.availableTickets,
      this.onTap, required this.trainNumber, required this.travelType, required this.transfers});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(logoImagePath),
                        width: 50.w,
                        height: 50.h,
                      ),
                      if (discount != null && discount != "")
                        Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            discount!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      if (showQrCode)
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: 50.0.r,
                        ),
                    ],
                  ),
                  Text(trainNumber),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        departureTime,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(2, 7, 102, 1),
                        ),
                      ),
                      Text(
                        departureCity,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(128, 128, 132, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arrivalTime,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(2, 7, 102, 1),
                        ),
                      ),
                      Text(arrivalCity),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(2, 7, 102, 1),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (availableTickets != null)
                        Row(
                          children: [
                            Text("Available Tickets : " ),
                            Text(
                              availableTickets.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: availableTickets == 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.user),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(travelType),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return buildJourneyDetailsBottomSheet();
                            },
                          );
                        },
                        child: Card(
                          color: const Color(0xffCCE1F7),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(transfers,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: const Color.fromRGBO(
                                            127, 146, 180, 1))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Icon(FontAwesomeIcons.circleArrowDown,
                                    color: Color.fromRGBO(127, 146, 180, 1)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      enableCancel
                          ? ElevatedButton(
                              onPressed: cancelOnPressed,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white),
                              child: Text("Cancel" ),
                            )
                          : Card(
                              color: const Color(0xffCCE1F7),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  availability,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xfff7f92b4),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildJourneyDetailsBottomSheet() {
    return Container(
      height: 300.h,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Journey Details' ,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Color.fromRGBO(2, 7, 102, 1),
          ),
          buildJourneyDetailsRow(departureTime, Icons.train, departureCity),
          const SizedBox(
            height: 10,
          ),
          buildJourneyDetailsRow(arrivalTime, Icons.location_on, arrivalCity),
          const SizedBox(
            height: 10,
          ),
          buildJourneyDetailsRow(
            "              ",
            Icons.bedroom_parent_outlined,
            "booking.com",
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Color.fromRGBO(2, 7, 102, 1),
          ),
          CustomMaterialButton(
              buttonText: "Select This Journey" ,
              onPressed: () {
                SelectWayController.instance.selectedWay = way!;
                Get.to(TrainDetails(
                  way: way!,
                  numberOfGuests: numberOfGuests,
                ));
              })
        ],
      ),
    );
  }

// Call when you want to show the date picker
  Widget buildJourneyDetailsRow(
    String time,
    IconData icon,
    String place,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              time,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              place,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
