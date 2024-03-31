import 'package:dughri/controller/select_way/select_way_controller.dart';
import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/core/constant/texts.dart';
import 'package:dughri/models/way.dart';
import 'package:dughri/view/Card/cardwidget.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/check_total_price.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/fare_conditions_container.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/select_class_container.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:dughri/widget/CustomMaterialButtom/custom_material.dart';
import 'package:dughri/widget/custom_dialog/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TrainDetails extends StatelessWidget {
  const TrainDetails(
      {Key? key, required this.way, required this.numberOfGuests})
      : super(key: key);
  final int numberOfGuests;
  final Way way;

  @override
  Widget build(BuildContext context) {
    final controller = SelectWayController.instance;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        title: Text('Way Details',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1))),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(2, 7, 102, 1),
        // Call when you want to show the date picker
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomizableTicketContainer(
                logoImagePath: Assets.imagesCompanylogo,
                trainNumber: controller.selectedWay.id,
                departureTime: '10:00 AM',
                departureCity: controller.selectedWay.from,
                duration: controller.selectedWay.time,
                arrivalTime: controller.selectedWay.arrivTime,
                arrivalCity: controller.selectedWay.to,
                price: kPriceType +
                    (controller.selectedWay.price * numberOfGuests).toString(),
                travelType: numberOfGuests.toString(),
                transfers: 'Transfers',
                availability: 'Limited availability',
                showQrCode: false,
                way: way,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                color: Color.fromRGBO(2, 7, 102, 1),
              ),
              CustomizableClassSelectionContainer(
                title: 'Select Your Class',
                classOptions: [
                  ClassOption(
                    className: 'Standard',
                    classImage: Assets.imagesLow,
                    classFeatures: [
                      ClassFeature(
                          icon: FontAwesomeIcons.wifi, text: 'Free Wi-Fi'),
                      ClassFeature(
                          icon: FontAwesomeIcons.plug, text: 'Power Plugs'),
                      ClassFeature(
                          icon: Icons.restaurant, text: 'Food available'),
                    ],
                    additionalCost: '0',
                  ),
                  ClassOption(
                    className: 'Standard Premium',
                    classImage: Assets.imagesBussenis,
                    classFeatures: [
                      ClassFeature(
                          icon: FontAwesomeIcons.wifi, text: 'Free Wi-Fi'),
                      ClassFeature(
                          icon: FontAwesomeIcons.plug, text: 'Power Plugs'),
                      ClassFeature(
                          icon: Icons.local_bar_outlined, text: 'Free drinks'),
                      ClassFeature(
                          icon: Icons.airline_seat_recline_extra,
                          text: 'Wide seat'),
                      ClassFeature(
                          icon: Icons.restaurant, text: 'Food available'),
                      ClassFeature(
                          icon: FontAwesomeIcons.newspaper,
                          text: 'Free newspaper'),
                    ],
                    additionalCost: '+\$80',
                  ),
                ],
              ),
              const Divider(
                color: Color.fromRGBO(2, 7, 102, 1),
              ),
              CustomizableFareConditionsContainer(
                fareType: 'Semi Flex',
                refundability: 'Non-refundable',
                exchangeability: 'Semi\nexchangeable',
                fareTerms:
                    'Semi Flex Ticket can be changed for free up to 7 days',
              ),
              const Divider(
                color: Color.fromRGBO(2, 7, 102, 1),
              ),
              CustomizableCard(
                icon: FontAwesomeIcons.user,
                iconText: '${numberOfGuests}x ${"passenger"}',
                ticketsText: 'Tickets:',
                totalPrice:
                    "${kPriceType} ${(controller.selectedWay.price * numberOfGuests)}",
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomMaterialButton(
                  buttonText: "Go to passenger details",
                  onPressed: () {
                    final auth = FirebaseAuth.instance;
                    if (auth.currentUser == null) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: "Not Logged In",
                          content: "Please log in to continue.",
                        ),
                      );
                    } else {
                      Get.to(() => const PaymentMethodScreen());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  final String balance;
  final String cardNumber;
  final Function onTopRightButtonClicked;
  final Gradient backgroundGradient;
  final Widget
      cardIcon; //Should be an Image.network(...) or Image.asset(...) Widget

  const CreditCard({
    Key? key,
    required this.onTopRightButtonClicked,
    required this.cardIcon,
    this.balance = "\$2,850.00",
    this.cardNumber = "****  ****  ****  3799",
    this.backgroundGradient =
        const LinearGradient(colors: [Colors.black87, Colors.black54]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: backgroundGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            offset: const Offset(0, 15),
            blurRadius: 45,
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  onTopRightButtonClicked();
                },
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardNumber,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/mastercard.png?alt=media&token=1ae51e14-5a60-4dbf-8a42-47cb9c3c1dfe",
                      width: 50,
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    balance,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Balance",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
