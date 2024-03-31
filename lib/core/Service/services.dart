import 'package:dughri/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainServices extends GetxService {
  late SharedPreferences prefs;

  Future<MainServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    prefs = await SharedPreferences.getInstance();
    return this;  // return MainServices()
  }
}

startMainServices() async {
  await Get.putAsync(() => MainServices().init());
}
