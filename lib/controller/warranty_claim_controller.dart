import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warranty_tracking_system/model.dart/warranty_claim.dart';

class WarrantyClaim {
  void claim(
    String oldBatterySNo,
    String newBatterySNo,
    String batteryModel,
    String oldBatteryWarrantyActivateDate,
    String newBatteryWarrantyActivatedDate,
    String warrantyExpireDate,
    String address,
    String mobileNo,
    String vehicleModel,
    String returnReson,
    String remark,
  ) {
    final claim = Claim(
      oldBatterySNo: oldBatterySNo,
      newBatterySNo: newBatterySNo,
      batteryModel: batteryModel,
      oldBatteryWarrantyActivateDate: oldBatteryWarrantyActivateDate,
      newBatteryWarrantyActivatedDate: newBatteryWarrantyActivatedDate,
      warrantyExpireDate: warrantyExpireDate,
      address: address,
      mobileNo: mobileNo,
      vehicleModel: vehicleModel,
      returnReson: returnReson,
      remark: remark
    );

    warrantyClaimActivation(claim);
  }

  Future warrantyClaimActivation(Claim claim) async{
    final docwarrantyClaim = FirebaseFirestore.instance.collection('WarantyClaim').doc();

    claim.id = docwarrantyClaim.id;
    final json = claim.toJson();
    await docwarrantyClaim.set(json);
  }
}
