import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
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
    _sendSMS(mobileNo, currentDate.split(" ")[0], warrantyExpireDate.toString().split(" ")[0]);
    clearFields();
  }

  void _sendSMS(String cNo, String wActivatedDate, String wEndDate) async{

    String message = 'Your+warranty+activated+from+$wActivatedDate+to+$wEndDate';

    try{
      Response response = await Dio().get("https://www.textit.biz/sendmsg?id=94770399391&pw=4033&to=$cNo&text=$message");
    }catch(e){
      print(e);
    }
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
