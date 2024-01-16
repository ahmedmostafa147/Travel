import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:flutter/material.dart';


class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                  showQrCode: true,
                )
            ],
          ),
        ),
      ),
    );
  }
}
