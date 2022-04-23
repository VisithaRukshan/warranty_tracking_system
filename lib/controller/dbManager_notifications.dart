import 'package:cloud_firestore/cloud_firestore.dart';

import '../support/global.dart';

class DBManagerNotificationList {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getProductList() async {
    List notificationList = [];

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    
    try {
      await _firestore.collection("Notifications").get().then((value) {
        value.docs.forEach((element) {
          notificationList.add(element.data());
        });
      });
      return notificationList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
