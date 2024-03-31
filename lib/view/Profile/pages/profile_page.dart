import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/core/Service/cloud_firestore/firestore_service.dart';
import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/core/constant/texts.dart';
import 'package:dughri/core/helpers/functions.dart';
import 'package:dughri/view/Profile/pages/edit_description.dart';
import 'package:dughri/view/Profile/pages/edit_email.dart';
import 'package:dughri/view/Profile/pages/edit_image.dart';
import 'package:dughri/view/Profile/pages/edit_name.dart';
import 'package:dughri/view/Profile/pages/edit_phone.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/Widget/ticket_container.dart';
import 'package:dughri/widget/custom_dialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user/user.dart';
import '../widgets/display_image_widget.dart';
import '../user/user_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username;
  String? email;
  String? phone;
  final user = UserData.myUser;
  List tickets = [];
  bool isLoading = true;
  Future<String?> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('username');
  }

  Future<String?> getuserEmailFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  Future<String?> getphoneFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('phone');
  }

  Future<String?> clearSpredf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
    return null;
  }

  Future<void> loadUserData() async {
    String? savedUsername = await getUsernameFromSharedPreferences();
    String? savedEmail = await getuserEmailFromSharedPreferences();
    String? savedPhone = await getphoneFromSharedPreferences();
    setState(() {
      username = savedUsername;
      email = savedEmail;
      phone = savedPhone;
      print("============================" '$username' '$email' '$phone');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
    getTodayTickets();
  }

  getTodayTickets() async {
    tickets = await CloudFirestoreService().getTodayTickets();
    setState(() {
      isLoading = false;
    });
  }

  cancelTicket(Map ticket) async {
    setState(() {
      isLoading = true;
    });
    await CloudFirestoreService().cancelTicket(ticket);
    await getTodayTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Edit Profile' ,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    navigateSecondPage(const EditImagePage());
                  },
                  child: DisplayImage(
                    imagePath: user.image,
                    onPressed: () {},
                  )),
              buildUserInfoDisplay(
                  username ?? " ", 'Name' , const EditNameFormPage()),
              buildUserInfoDisplay(
                  phone ?? " ", 'Phone' , const EditPhoneFormPage()),
              buildUserInfoDisplay(
                  email ?? " ", 'Email' , const EditEmailFormPage()),
              Text(
                "Today Tickets" ,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
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
                                  enableCancel: true,
                                  cancelOnPressed: () async {
                                    bool isTimeLeft =
                                        HelperFunctions.checkTimeLeft(
                                            ticketDepTime: ticket['depTime']);
                                    if (isTimeLeft) {
                                      // you can't cancel the ticket
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomDialog(
                                          title: "Warning" ,
                                          content:
                                              "you can't cancel this ticket" ,
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomDialog(
                                          title: "Warning" ,
                                          content:
                                              "${"there will be a tax" } 10%"
                                                   ,
                                          showCancel: true,
                                          okColor: Colors.red,
                                          onPressedOk: () {
                                            cancelTicket(ticket);
                                            Get.back();
                                          },
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(User user) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us About Yourself' ,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      navigateSecondPage(const EditDescriptionFormPage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          user.aboutMeDescription,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
