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

  const CustomizableTicketContainer({
    super.key,
    required this.logoImagePath,
    required this.trainNumber,
    required this.departureTime,
    required this.departureCity,
    required this.duration,
    required this.arrivalTime,
    required this.arrivalCity,
    required this.price,
    required this.travelType,
    required this.transfers,
    required this.availability,
    required this.showQrCode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const TrainDetails());
      },
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
                      if (showQrCode)
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: 50.0.r,
                        )
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
                      const Text(
                        "Paris",
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
                      const Text("landon"),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('\$100',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(2, 7, 102, 1))),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(FontAwesomeIcons.user),
                      SizedBox(
                        width: 10,
                      ),
                      Text('1-One-Way'),
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
                                    color:
                                        const Color.fromRGBO(127, 146, 180, 1)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: const Color(0xffCCE1F7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(availability,
                              style: const TextStyle(
                                  fontSize: 15, color: Color(0xfff7f92b4))),
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
          const Text(
            'Journey Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Color.fromRGBO(2, 7, 102, 1),
          ),
          buildJourneyDetailsRow("2:00 PM", Icons.train, "London"),
          const SizedBox(
            height: 10,
          ),
          buildJourneyDetailsRow("2:00 PM", Icons.location_on, "paris"),
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
              buttonText: "Select This Journey",
              onPressed: () {
                Get.to(const TrainDetails());
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
