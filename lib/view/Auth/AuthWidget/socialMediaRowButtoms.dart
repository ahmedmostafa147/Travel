import 'package:dughri/view/Auth/AuthWidget/SocialMediaButtom.dart';
import 'package:flutter/material.dart';



class socialMediaRowButtoms extends StatelessWidget {
  const socialMediaRowButtoms({super.key});



  Future signInWithGoogle() async {
    // // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if (googleUser == null) {
    //   return;
    // }

    // // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // // Once signed in, return the UserCredential
    // await FirebaseAuth.instance.signInWithCredential(credential);
    // Get.offAll(const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          SocialMediaButton(
            IconName: IconButton(
                onPressed: () {
                  signInWithGoogle();
                },
                
                icon: const Icon(Icons.g_mobiledata_sharp, color: Colors.red)

                ),
          ),
        ],
      ),
    );
  }
}
