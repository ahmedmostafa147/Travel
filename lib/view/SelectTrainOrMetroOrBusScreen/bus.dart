import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/custom_filter_chip_list.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bus extends StatefulWidget {
  const Bus({super.key});

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: CustomFilterChipList(
                      filterOptions: const ['Price', 'Departure Time', 'Stops'],
                      onSelected: (selectedOption) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomizableTicketContainer(
                logoImagePath: Assets.imagesCompanylogo,
                trainNumber: '9007',
                departureTime: '10:00 AM',
                departureCity: 'Paris',
                duration: '2h24m',
                arrivalTime: '2:00 PM',
                arrivalCity: 'London',
                price: '\$100',
                travelType: '1-One-Way',
                transfers: 'Transfers',
                availability: 'Limited availability',
                showQrCode: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
