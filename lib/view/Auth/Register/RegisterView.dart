import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/view/Auth/AuthWidget/custombuttonauth.dart';
import 'package:dughri/view/Auth/AuthWidget/customlogoauth.dart';
import 'package:dughri/view/Auth/AuthWidget/textformfield.dart';
import 'package:dughri/view/Auth/Login/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool isLSignup = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      // Create a new user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      User? user = userCredential.user;

      await _firestore.collection('users').doc(user!.uid).set({
        'username': username.text.trim(),
        'email': email.text.trim(),
        'phone': phone.text.trim(),
        'tickets' : 0
      });
      // Save username to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username.text.trim());
      prefs.setString('userEmail', email.text.trim());
      prefs.setString('phone', phone.text.trim());

      // Do something with the user data
      print('User Registered with Email: ${user.email}');
      print('User UID: ${user.uid}');
    } on FirebaseAuthException catch (e) {
      // Handle registration errors
      print('Error: ${e.message}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLSignup = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLSignup == false
          ? Scaffold(
              resizeToAvoidBottomInset: true,
              body: Form(
                key: fromkey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 50.h),
                        const CustomLogoAuth(),
                        Container(height: 20.h),
                        Center(
                          child: Text("Welcome To DOغRY" ,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Play")),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("REGISTER" ,
                            style: TextStyle(
                                fontSize: 30.sp, fontWeight: FontWeight.w200)),
                        Container(height: 10.h),
                        Text("Register To Continue Using DOغRY" ,
                            style: const TextStyle(color: Colors.grey)),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextForm(
                          HintText: "ُEnter Your username" ,
                          mycontroller: username,
                          LabelText: "username" ,
                          validator: "please enter username" ,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextForm(
                          HintText: "ُEnter Your Email" ,
                          mycontroller: email,
                          LabelText: "Email" ,
                          validator: 'Please enter your email!' ,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextForm(
                          HintText: "ُEnter Your Phone" ,
                          mycontroller: phone,
                          LabelText: "Phone" ,
                          validator: 'Please enter your Phone!' ,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextForm(
                          HintText: "ُEnter Your Password" ,
                          mycontroller: password,
                          LabelText: "Password" ,
                          validator: 'Please enter your password!' ,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButtonAuth(
                            title: "Register" ,
                            onPressed: () async {
                              try {
                                await registerUser();
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }),
                    Container(height: 20),

                    Container(height: 20),
                    // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLSignup = true;
                        });
                        //  Get.to(() => const LoginView());
                      },
                      child: Center(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Have An Account ? " ,
                          ),
                          TextSpan(
                              text: "Login" ,
                              style: const TextStyle(
                                  color: Color.fromARGB(251, 251, 107, 108),
                                  fontWeight: FontWeight.bold)),
                        ])),
                      ),
                    )
                  ]),
                ),
              ),
            )
          : const LoginView(),
    );
  }
}
