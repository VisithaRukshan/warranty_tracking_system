class Warranty{
  String id;
  String? sNo;
  String? model;
  String? currentDate;
  String? warrantyExpireDate;
  String? address;
  String? mobileNo;
  String? vehicleModel;
  String? currentDateTime;
  String? warrantyType;

  Warranty({
    this.id ='',
    this.sNo,
    this.model,
    this.currentDate,
    this.warrantyExpireDate,
    this.address,
    this.mobileNo,
    this.vehicleModel,
    this.currentDateTime,
    this.warrantyType
  });

  Map<String , dynamic> toJson() => {
    'id': id,
    'sNo': sNo,
    'model': model,
    'activationDate':currentDate,
    'warrantyExpireDate': warrantyExpireDate,
    'address': address,
    'mobileNo':mobileNo,
    'vehicleModel': vehicleModel,
    'currentDatTime': currentDateTime,
    'warrantyType': warrantyType
  };

}