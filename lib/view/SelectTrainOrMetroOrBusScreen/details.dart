import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/view/Card/cardwidget.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/check_total_price.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/fare_conditions_container.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/select_class_container.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:dughri/widget/CustomMaterialButtom/custom_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TrainDetails extends StatelessWidget {
  const TrainDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        title: const Text('Train Details',
            style: TextStyle(
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
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                color: Color.fromRGBO(2, 7, 102, 1),
              ),
              const CustomizableClassSelectionContainer(
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
                  ClassOption(
                    className: 'Business Premium',
                    classImage: Assets.imagesFirst,
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
                    additionalCost: '+\$150',
                  ),
                ],
              ),
              const Divider(
                color: Color.fromRGBO(2, 7, 102, 1),
              ),
              const CustomizableFareConditionsContainer(
                fareType: 'Semi Flex',
                refundability: 'Non-refundable',
                exchangeability: 'Semi\nexchangeable',
                fareTerms:
                    'Semi Flex Ticket can be changed for free up to 7 days',
              ),
              const Divider(
                color: Color.fromRGBO(2, 7, 102, 1),
              ),
             const CustomizableCard(
  icon: FontAwesomeIcons.user,
  iconText: '1x passenger',
  ticketsText: 'Tickets:',
  totalPrice: '\$250',
),
SizedBox(height: 10.h,),
                  CustomMaterialButton(
                      buttonText: "Go to passenger details",
                      onPressed: () {
                        Get.to(const PaymentMethodScreen());
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
