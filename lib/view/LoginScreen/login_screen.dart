import 'package:dughri/core/constant/images_path.dart';
import 'package:dughri/widget/Custom_Material_Buttom/custom_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Image(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 29, 59, 148),
                      foregroundColor: Colors.white,
                      shadowColor: const Color(0xff142968),
                      elevation: 5,
                      minimumSize: const Size(150, 50),
                      shape: const LinearBorder()),
                  icon: const Icon(FontAwesomeIcons.facebook,
                      color: Colors.white),
                  label: const Text('Continue with Facebook'),
                  onPressed: () {
                    // Handle Facebook login logic here
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shadowColor: Colors.white,
                      elevation: 5,
                      minimumSize: const Size(150, 50),
                      shape: const LinearBorder()),
                  icon: const Icon(FontAwesomeIcons.google, color: Colors.red),
                  label: const Text('Continue with Google'),
                  onPressed: () {
                    // Handle Google login logic here
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(251, 251, 107, 108),
                      foregroundColor: Colors.white,
                      shadowColor: const Color.fromARGB(251, 251, 107, 108),
                      elevation: 5,
                      minimumSize: const Size(150, 50),
                      shape: const LinearBorder()),
                  icon: const Icon(Icons.email, color: Colors.white),
                  label: const Text('Continue with Email'),
                  onPressed: () {
                    // Handle Email login logic here
                  },
                ),
              ],
            ),
          ),
           SizedBox(
            height: 50.sp,
          ),
          const Text(
              " By continuing you agree to our Terms of Service and Privacy Policy")
        ],
      ),
    );
  }
}
