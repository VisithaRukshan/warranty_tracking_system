import 'package:cloud_firestore/cloud_firestore.dart';

import '../support/global.dart';

class DBManagerProductList {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getProductList() async {
    List itemList = [];
    List E001 = [];
    List E002 = [];
    List E003 = [];
    List E004 = [];

    String newDate = DateTime.now().toString().split(" ")[0];
    String e001Date;
    String e002Date;
    String e003Date;
    String e004Date;

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore.collection("E001").get().then((value) {
      value.docs.forEach((element) {
        E001.add(element.data());
      });

      e001Date = E001[0]['stockInDate'];

      for (var i = 0; i < value.size; i++) {
        newDate = E001[i]['stockInDate'];

        if (e001Date.compareTo(newDate) < 0) {
          newDate = e001Date;
        } else {
          e001SDate = E001[i]['stockInDate'];
          e001Sno = E001[i]['sNo'];
          e001Date = e001SDate;
        }
      }
      newDate = DateTime.now().toString().split(" ")[0];
    });

    await _firestore.collection("E002").get().then((value) {
      value.docs.forEach((element) {
        E002.add(element.data());
      });

      e002Date = E002[0]['stockInDate'];

      for (var i = 0; i < value.size; i++) {
        newDate = E002[i]['stockInDate'];

        if (e002Date.compareTo(newDate) < 0) {
          newDate = e002Date;
        } else {
          e002SDate = E002[i]['stockInDate'];
          e002Sno = E002[i]['sNo'];
          e002Date = e002SDate;
        }
      }
      newDate = DateTime.now().toString().split(" ")[0];
    });

    await _firestore.collection("E003").get().then((value) {
      value.docs.forEach((element) {
        E003.add(element.data());
      });

      e003Date = E003[0]['stockInDate'];

      for (var i = 0; i < value.size; i++) {
        newDate = E003[i]['stockInDate'];

        if (e003Date.compareTo(newDate) < 0) {
          newDate = e003Date;
        } else {
          e003SDate = E003[i]['stockInDate'];
          e003Sno = E003[i]['sNo'];
          e003Date = e003SDate;
        }
      }
      newDate = DateTime.now().toString().split(" ")[0];
    });

    await _firestore.collection("E004").get().then((value) {
      value.docs.forEach((element) {
        E004.add(element.data());
      });

      e004Date = E004[0]['stockInDate'];

      for (var i = 0; i < value.size; i++) {
        newDate = E004[i]['stockInDate'];

        if (e004Date.compareTo(newDate) < 0) {
          newDate = e004Date;
        } else {
          e004SDate = E004[i]['stockInDate'];
          e004Sno = E004[i]['sNo'];
          e004Date = e004SDate;
        }
      }
      newDate = DateTime.now().toString().split(" ")[0];
    });

    try {
      await _firestore.collection("Products").get().then((value) {
        value.docs.forEach((element) {
          itemList.add(element.data());
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
