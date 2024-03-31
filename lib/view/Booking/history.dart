import 'package:dughri/core/Service/cloud_firestore/firestore_service.dart';
import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/core/constant/texts.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archived extends StatefulWidget {
  const Archived({super.key});

  @override
  State<Archived> createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  List tickets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMyCanceledTickets();
  }

  getMyCanceledTickets() async {
    // check if user login first or not to show her booked tickets
    if (FirebaseAuth.instance.currentUser != null) {
      tickets = await CloudFirestoreService().getCanceledTickets();
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : tickets.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage(Assets.imagesTicket),
                            height: 300,
                          ),
                          Text(
                            "your tickets will archived here",
                          )
                        ],
                      )
                    : Column(
                        children: tickets
                            .map(
                              (ticket) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: CustomizableTicketContainer(
                                  logoImagePath: Assets.imagesCompanylogo,
                                  trainNumber: ticket['id'],
                                  departureTime: ticket['depTime'],
                                  departureCity: ticket['from'],
                                  duration: ticket['time'],
                                  arrivalTime: ticket['arrivTime'],
                                  arrivalCity: ticket['to'],
                                  price: "$kPriceType${ticket['price']}",
                                  travelType:
                                      ticket['numberOfGuests'].toString(),
                                  transfers: 'Transfers',
                                  availability: 'Limited availability',
                                  showQrCode: true,
                                  discount: ticket['discount'],
                                ),
                              ),
                            )
                            .toList(),
                      ),
          ),
        ),
      ),
    );
  }
}
