import 'package:dughri/core/Service/cloud_firestore/firestore_service.dart';
import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/core/constant/texts.dart';
import 'package:dughri/core/helpers/functions.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:dughri/widget/custom_dialog/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});
  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  List tickets = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getMyTickets();
  }

  getMyTickets() async {
    // check if user login first or not to show her booked tickets
    if (FirebaseAuth.instance.currentUser != null) {
      tickets = await CloudFirestoreService().getBookedTickets();
    }

    setState(() {
      isLoading = false;
    });
  }

  cancelTicket(Map ticket) async {
    setState(() {
      isLoading = true;
    });
    await CloudFirestoreService().cancelTicket(ticket);
    await getMyTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
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
                            travelType: ticket['numberOfGuests'].toString(),
                            transfers: 'Transfers',
                            availability: 'Limited availability',
                            showQrCode: true,
                            enableCancel: true,
                            cancelOnPressed: () async {
                              bool isTimeLeft = HelperFunctions.checkTimeLeft(
                                  ticketDepTime: ticket['depTime']);
                              if (isTimeLeft) {
                                // you can't cancel the ticket
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomDialog(
                                    title: "Warning",
                                    content: "you can't cancel this ticket",
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomDialog(
                                    title: "Warning",
                                    content: "${"there will be a tax"} 10%",
                                    showCancel: true,
                                    okColor: Colors.red,
                                    onPressedOk: () {
                                      cancelTicket(ticket);
                                      Get.back();
                                    },
                                  ),
                                );
                              }
                            },
                            discount: ticket['discount'],
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
