import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/core/Service/cloud_firestore/firestore_service.dart';
import 'package:dughri/core/helpers/functions.dart';
import 'package:dughri/models/way.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectWayController extends GetxController {
  static SelectWayController get instance => Get.find();
  bool isLoading = true;
  String? from;
  String? to;
  // String? startDate;
  // String? endDate;
  late int numberOfGuests;
  late Way selectedWay;


  Map<String, List<Way>> availableWays = {
    'train': [],
    'bus': [],
    'metro': [],
    'monorail': []
  };

  initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    from = prefs.getString("from");
    to = prefs.getString("to");
    // startDate = prefs.getString('startDate');
    // endDate = prefs.getString('endDate');
  }

  getAvailableWays() async {
    CollectionReference ways = FirebaseFirestore.instance.collection('Ways'); // train bus metro monorail
    await ways.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        Way way = Way.fromJson(doc.data() as Map<String, dynamic>);
        // bool inDate = HelperFunctions.checkInDate(way.date, startDate!, endDate!);

        if (from == way.from && to == way.to) {
          way.documentId = doc.id;
          if (way.wayName == 'Train') {
            availableWays['train']!.add(way);
          } else if (way.wayName == 'Bus') {
            availableWays['bus']!.add(way);
          } else if (way.wayName == 'Metro') {
            availableWays['metro']!.add(way);
          } else if (way.wayName == 'Monorail') {
            availableWays['monorail']!.add(way);
          }
        }
      }
    });
    isLoading = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await initData();
    await getAvailableWays();
  }
}
