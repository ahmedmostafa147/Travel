import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/view/Auth/AuthWidget/SocialMediaButtom.dart';
import 'package:dughri/view/Auth/AuthWidget/custombuttonauth.dart';
import 'package:dughri/view/Auth/AuthWidget/customlogoauth.dart';
import 'package:dughri/view/Auth/AuthWidget/textformfield.dart';
import 'package:dughri/view/Auth/Register/RegisterView.dart';
import 'package:dughri/view/Profile/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;
  bool isSignup = false;
  String? username;

  Future<String?> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<void> loadUsername() async {
    String? savedUsername = await getUsernameFromSharedPreferences();
    setState(() {
      username = savedUsername;
      print("============================" '$username');
    });
  }

  Future<void> loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      User? user = userCredential.user;
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(user!.uid).get();
      String userName = userSnapshot['username'] ?? 'N/A';
      String userEmail = userSnapshot['email'] ?? 'N/A';
      String phone = userSnapshot['phone'] ?? "";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', userName);
      prefs.setString('userEmail', userEmail);
      prefs.setString('phone', phone);
      loadUsername();
      print('User Email: $userEmail');
      print('User UID: ${user.uid}');
      print('User Name: $userName');
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      print('Error: ${e.message}');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loginUserWithGoogle() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Trigger Google Sign-In
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        setState(() {
          isLoading = false;
        });
        return; // User canceled Google Sign-In
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Authenticate with Firebase using Google credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      // Add your logic to save user data to Firestore or SharedPreferences
      // For example, you can save user information to Firestore as you did before

      if (user != null) {
        username = user.displayName;
        bool userExist = await checkIfUserExist(user.uid);
        if (!userExist) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'email': user.email,
            'phone': "",
            'tickets': 0
          });
        }

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', user.displayName ?? 'username');
        prefs.setString('userEmail', user.email!);
        prefs.setString('phone', "");
      }

      // Continue with the rest of your logic...
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      print('Error: ${e.message}');
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> checkIfUserExist(String userId) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where(FieldPath.documentId, isEqualTo: userId)
          .limit(1)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking document ID existence: $e");
      return false; // Assume document doesn't exist in case of an error
    }
  }

  @override
  void initState() {
    super.initState();
    loadUsername();
    isSignup = false;
  }

  @override
  Widget build(BuildContext context) {
    return username == null || username == ""
        ? SafeArea(
            child: isSignup == false
                ? Scaffold(
                    resizeToAvoidBottomInset: true,
                    body: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
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
                                  child: Text("Welcome To DOغRY" ,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Play")),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "LOGIN" ,
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text("Login To Continue Using DOغRY" ,
                                    style: const TextStyle(
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
                                      HintText: "ُEnter Your Email" ,
                                      mycontroller: email,
                                      LabelText: "Email" ,
                                      validator: "please enter your email!" ,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CustomTextForm(
                                      HintText: "ُEnter Your Password" ,
                                      mycontroller: password,
                                      LabelText: "Password" ,
                                      validator:
                                          "please enter your password!" ,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        try {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.leftSlide,
                                            title: 'Success' ,
                                            desc:
                                                'Please check your email to reset your password.'
                                                     ,
                                            btnCancelOnPress: () {},
                                            btnOkOnPress: () {},
                                          ).show();
                                        } catch (e) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.leftSlide,
                                            title: 'Error' ,
                                            desc:
                                                "We can't find a user with that email address, Please re-enter your email and try again."
                                                     ,
                                            btnCancelOnPress: () {},
                                            btnOkOnPress: () {},
                                          ).show();
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, bottom: 20),
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'Forgot your password?' ,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : CustomButtonAuth(
                                        title: "Login" ,
                                        onPressed: () async {
                                          if (fromkey.currentState!
                                              .validate()) {
                                            await loginUser();
                                          }
                                        },
                                      ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text("OR LOGIN with" ,
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                    SizedBox(width: 10.w),
                                    const Expanded(
                                      child: Divider(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                // loginUserWithGoogle
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SocialMediaButton(
                                        IconName: IconButton(
                                          onPressed: loginUserWithGoogle,
                                          icon: const Icon(
                                            Icons.g_mobiledata_sharp,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSignup = true;
                                    });

                                    // Get.off(() => const );
                                  },
                                  child: Center(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: "Don't Have An Account ? " ,
                                      ),
                                      TextSpan(
                                          text: "Register" ,
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                251, 251, 107, 108),
                                          )),
                                    ])),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const RegisterView(),
          )
        : const ProfilePage();
  }
}
