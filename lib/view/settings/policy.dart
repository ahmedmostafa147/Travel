import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  final String termsUrl =
      'https://www.termsfeed.com/public/uploads/2021/12/sample-terms-conditions-agreement.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      // body: WebView(
      //   initialUrl: termsUrl,
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
