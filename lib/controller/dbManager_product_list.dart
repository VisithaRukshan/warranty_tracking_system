import 'package:cloud_firestore/cloud_firestore.dart';

class DBManagerProductList {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<void> createProductData(
  //   String productName,
  //   String productId,
  //   String price,
  //   String creditD,
  //   String cashD,
  // ) async {
  //   return await productList.doc(productId).set({
  //     'productName':productName,
  //     'productID':productId,
  //     'price':price,
  //     'cashDiscount': cashD,
  //     'creditDiscount': creditD,
  //   });
  // }

  Future getProductList() async {
    List itemList = [];
    Map<String, dynamic> warrantyMap;

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
