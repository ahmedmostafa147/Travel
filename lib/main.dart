import 'package:dughri/theme/ThemesStyle.dart';
import 'package:dughri/view/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting().then((_) => runApp(DevicePreview(
        enabled: false,
        builder: (context) => const Travel(), // Wrap your app
      )));
}

class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            theme: lightTheme,
            themeMode: ThemeMode.light,
            title: 'DOغRY',
            home: const MyCustomSplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
