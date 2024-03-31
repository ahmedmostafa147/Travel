// import 'package:dughri/core/Service/services.dart';
// // import 'package:dughri/localization/locale_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Language extends StatefulWidget {
//   const Language({super.key});

//   @override
//   State<Language> createState() => _LanguageState();
// }

// class _LanguageState extends State<Language> {
//   String selectedLanguage =
//       Get.find<MainServices>().prefs.getString('lang') ?? 'en';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Language Selection'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Radio(
//                 value: 'en',
//                 groupValue: selectedLanguage,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedLanguage = "en";
//                   });
//                 },
//               ),
//               Text('English'),
//               Radio(
//                 value: 'ar',
//                 groupValue: selectedLanguage,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedLanguage = 'ar';
//                   });
//                 },
//               ),
//               Text('Arabic'),
//             ],
//           ),
//           SizedBox(height: 20.h),
//           ElevatedButton(
//             onPressed: () {
//               LocaleController().changeLanguage(selectedLanguage);
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
