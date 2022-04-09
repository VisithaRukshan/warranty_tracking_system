class Claim {
  String? id;
  String? oldBatterySNo;
  String? newBatterySNo;
  String? batteryModel;
  String? oldBatteryWarrantyActivateDate;
  String? newBatteryWarrantyActivatedDate;
  String? warrantyExpireDate;
  String? address;
  String? mobileNo;
  String? vehicleModel;
  String? returnReson;
  String? remark;

  Claim(
      {this.id,
      this.oldBatterySNo,
      this.newBatterySNo,
      this.batteryModel,
      this.oldBatteryWarrantyActivateDate,
      this.newBatteryWarrantyActivatedDate,
      this.warrantyExpireDate,
      this.address,
      this.mobileNo,
      this.vehicleModel,
      this.returnReson,
      this.remark});

  Map<String, dynamic> toJson() => {
        'id': id,
        'oldBatterySNo': oldBatterySNo,
        'newBatterySNo': newBatterySNo,
        'batteryModel': batteryModel,
        'oldBatteryWarrantyActivateDate': oldBatteryWarrantyActivateDate,
        'newBatteryWarrantyActivatedDate': newBatteryWarrantyActivatedDate,
        'warrantyExpireDate': warrantyExpireDate,
        'address': address,
        'mobileNo': mobileNo,
        'vehicleModel': vehicleModel,
        'returnReson': returnReson,
        'remark': remark,
      };
}
