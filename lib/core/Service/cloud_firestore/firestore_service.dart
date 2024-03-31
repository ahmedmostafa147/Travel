import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dughri/core/helpers/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class CloudFirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  CloudFirestoreService();

  Stream<QuerySnapshot<Map<String, dynamic>>> getWays(String orderBy) {
    return db.collection('Ways').orderBy(orderBy).snapshots();
  }

  Future<List> getHotels(String location) async {
    List hotels = [];
    await db
        .collection('Hotels')
        .where('location', isEqualTo: location)
        .get()
        .then((QuerySnapshot snapshot) {
      hotels = snapshot.docs.map((doc) => doc.data()).toList();
    });
    return hotels;
  }

  Future<List> getBookedTickets() async {
    final auth = FirebaseAuth.instance;
    List myTickets = [];
    if (auth.currentUser != null) {
      CollectionReference tickets =
          FirebaseFirestore.instance.collection('Tickets');
      await tickets
          .where('userId', isEqualTo: auth.currentUser!.uid)
          .get()
          .then((QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          Map data = doc.data() as Map;
          data['docId'] = doc.id;
          myTickets.add(data);
        }
      });
    }
    return myTickets;
  }

  cancelTicket(Map ticketData) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('Tickets').doc(ticketData['docId']).delete();

    await firestore.collection("CanceledTickets").add({
      "arrivTime": ticketData['arrivTime'],
      "date": ticketData['date'],
      "depTime": ticketData['depTime'],
      "from": ticketData['from'],
      "id": ticketData['id'],
      "numberOfGuests": ticketData['numberOfGuests'],
      "price": ticketData['price'],
      "time": ticketData['time'],
      "to": ticketData['to'],
      "tax": 10,
      "discount": ticketData['discount'],
      "userId": FirebaseAuth.instance.currentUser!.uid,
    });
  }

  Future<List> getCanceledTickets() async {
    final auth = FirebaseAuth.instance;
    List myTickets = [];
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('CanceledTickets');
    await tickets
        .where('userId', isEqualTo: auth.currentUser?.uid)
        .get()
        .then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        Map data = doc.data() as Map;
        data['docId'] = doc.id;
        myTickets.add(data);
      }
    });
    return myTickets;
  }

  Future<List> getTodayTickets() async {
    List todayTickets = await getBookedTickets().then(
      (tickets) => tickets.where((ticket) {
        final dateNow = DateFormat("dd/MM/yyyy").format(DateTime.now());
        return HelperFunctions.isDatesEquals(dateNow, ticket['date']);
      }).toList(),
    );
    return todayTickets;
  }
}
