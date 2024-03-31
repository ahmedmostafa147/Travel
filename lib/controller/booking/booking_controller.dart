import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/models/way.dart';
import 'package:dughri/widget/NavBar/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BookTicketController extends GetxController {
  static BookTicketController get instance => Get.find();

  bookNow(Way way, int numberOfGuests) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    bool hasDiscount = false;
    try {
      final auth = FirebaseAuth.instance;
      final int ticketsBookedBefore = await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((snapshot) => snapshot.data()!['tickets']);
      if (ticketsBookedBefore >= 5) {
        hasDiscount = true; // 10%
        await firestore.collection('users').doc(auth.currentUser!.uid).update({
          'tickets': 0,
        });
      } else {
        await firestore.collection('users').doc(auth.currentUser!.uid).update({
          'tickets': ticketsBookedBefore + numberOfGuests,
        });
      }

      await firestore.collection("Tickets").add({
        "arrivTime": way.arrivTime,
        "date": way.date,
        "depTime": way.depTime,
        "from": way.from,
        "id": way.id,
        "numberOfGuests": numberOfGuests,
        "price": way.price * numberOfGuests * (hasDiscount ? .9 : 1),
        "time": way.time,
        "to": way.to,
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "discount": hasDiscount ? "10%" : "",
      });
      await firestore.collection('Ways').doc(way.documentId).update({
        'avTickets': way.avTickets -= numberOfGuests,
      });
      // num of ticket to get discount after

      Get.snackbar("success", "success booking the tickets");
      Get.offAll(
        () => const NavBar(),
      );
    } catch (e) {}
  }
}
