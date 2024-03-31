import 'package:dughri/core/Service/services.dart';
// import 'package:dughri/localization/translations_file.dart';
import 'package:dughri/theme/ThemesStyle.dart';
import 'package:dughri/view/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
// import 'localization/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startMainServices(); // services like firebase and shared preferences

  initializeDateFormatting().then(
    (_) => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const Travel(), // Wrap your app
      ),
    ),
  );
}

class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    // LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            // locale: controller.language,
            // translations: TranslationsFile() ,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            title: 'DOغRY',
            home: const MyCustomSplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
