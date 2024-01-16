import 'package:dughri/view/Auth/AuthWidget/custombuttonauth.dart';
import 'package:dughri/view/Auth/AuthWidget/customlogoauth.dart';
import 'package:dughri/view/Auth/AuthWidget/socialMediaRowButtoms.dart';
import 'package:dughri/view/Auth/AuthWidget/textformfield.dart';
import 'package:dughri/view/Auth/Register/RegisterView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Form(
            key: fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50.h),
                const Center(
                  child: CustomLogoAuth(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text("Welcome To DOغRY",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Play")),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "LOGIN",
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w200),
                ),
                const Text("Login To Continue Using DOغRY",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextForm(
                      HintText: "ُEnter Your Email",
                      mycontroller: email,
                      LabelText: "Email",
                      validator: "please enter your email!",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextForm(
                      HintText: "ُEnter Your Password",
                      mycontroller: password,
                      LabelText: "Password",
                      validator: "please enter your password!",
                    ),
                    InkWell(
                      onTap: () async {
                        try {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.leftSlide,
                            title: 'Success',
                            desc:
                                'Please check your email to reset your password.',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.leftSlide,
                            title: 'Error',
                            desc:
                                "We can't find a user with that email address, Please re enter your email and try again.",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          )),
                    )
                  ],
                ),
                CustomButtonAuth(
                  title: "Login",
                  onPressed: () async {},
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(),
                    ),
                    SizedBox(width: 10.w),
                    const Text("OR LOGIN with",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 10.w),
                    const Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                const socialMediaRowButtoms(),
                SizedBox(height: 30.h),
                InkWell(
                  onTap: () {
                    Get.off(() => const RegisterView());
                  },
                  child: const Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Don't Have An Account ? ",
                      ),
                      TextSpan(
                          text: "Resister",
                          style: TextStyle(
                            color: const Color.fromARGB(251, 251, 107, 108),
                          )),
                    ])),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
