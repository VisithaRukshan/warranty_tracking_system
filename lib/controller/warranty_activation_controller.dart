import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warranty_tracking_system/model.dart/warranty.dart';

import 'package:warranty_tracking_system/support/global.dart';

class WarrantyActivation {
  void createWarranty(
    String sNo,
    String model,
    String currentDate,
    String warrantyExpireDate,
    String address,
    String mobileNo,
    String vehicleModel,
  ) {
    final warranty = Warranty(
        sNo: sNo,
        model: model,
        currentDate: currentDate.split(" ")[0],
        warrantyExpireDate: warrantyExpireDate.toString().split(" ")[0],
        address: address,
        mobileNo: mobileNo,
        vehicleModel: vehicleModel,
        currentDateTime: currentDate);

    activateWarranty(warranty);
    clearFields();
  }

  Future activateWarranty(Warranty warranty) async {
    final docWarranty = FirebaseFirestore.instance.collection('ActivatedWarranty').doc();

    warranty.id = docWarranty.id;

    final json = warranty.toJson();
    await docWarranty.set(json);
  }

  void clearFields() {
    sNo = '';
    batModel = '';
    warrantyExpireDate = null;
  }
}
