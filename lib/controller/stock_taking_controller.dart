import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warranty_tracking_system/model.dart/stock.dart';

class StockTaking{
  Future<void> stock(
    String sNo,
    String stockInDate,
  ) async {
    final stock = Stock(
      sNo: sNo,
      stockInDate : stockInDate,
    );

  final docWarranty = FirebaseFirestore.instance.collection(sNo.substring(0, 4)).doc();

    stock.id = sNo;

    final json = stock.toJson();
    await docWarranty.set(json);
  }
}