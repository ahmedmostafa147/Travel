import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/view/Profile/pages/edit_email.dart';
import 'package:dughri/view/Profile/pages/edit_image.dart';
import 'package:dughri/view/Profile/pages/edit_name.dart';
import 'package:dughri/view/Profile/pages/edit_phone.dart';
import 'package:dughri/view/Profile/widgets/display_image_widget.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profile6 extends StatelessWidget {
  static const routeName = '/Profile6';

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 10.0),
          _buildInfo(context, widthC),
          SizedBox(
            height: 20.h,
          ),
          CustomizableTicketContainer(
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
    ));
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            gradient: LinearGradient(colors: [
              const Color.fromARGB(251, 251, 107, 108),
              const Color.fromARGB(251, 251, 107, 108),
              const Color.fromARGB(251, 251, 107, 108),
              const Color.fromARGB(251, 251, 107, 108),
              const Color.fromARGB(251, 251, 107, 108),
            ]),
          ),
        ),
        Ink(
          height: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 146, 34, 34),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 140),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.white,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [
                      const Color.fromARGB(251, 251, 107, 108),
                      const Color.fromARGB(251, 251, 107, 108),
                      const Color.fromARGB(251, 251, 107, 108),
                      const Color.fromARGB(251, 251, 107, 108),
                      const Color.fromARGB(251, 251, 107, 108),
                    ]),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(85),
                      child: InkWell(
                          onTap: () {
                            Get.to(const EditImagePage());
                          },
                          child: DisplayImage(
                            imagePath: 'assets/images/1.jpg',
                            onPressed: () {},
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Get.to(const EditNameFormPage());
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Color.fromARGB(251, 251, 107, 108),
                          ),
                          title: Text("Name"),
                          subtitle: Text("Ahmed"),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          Get.to(const EditEmailFormPage());
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Color.fromARGB(251, 251, 107, 108),
                          ),
                          title: Text("E-Mail"),
                          subtitle: Text("email@gmailc.com"),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          Get.to(const EditPhoneFormPage());
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Color.fromARGB(251, 251, 107, 108),
                          ),
                          title: Text("Phone Number"),
                          subtitle: Text("11-111111-11"),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          //اخر لوكيشن اتعمله سيف يبقي هنا
                        },
                        child: const ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(
                            Icons.my_location,
                            color: Color.fromARGB(251, 251, 107, 108),
                          ),
                          title: Text("Location"),
                          subtitle: Text("Canada"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
