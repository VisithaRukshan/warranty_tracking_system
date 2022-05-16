import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:warranty_tracking_system/controller/warranty_activation_controller.dart';
import 'package:warranty_tracking_system/controller/warranty_claim_controller.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';
import 'package:warranty_tracking_system/support/qr_code_reader.dart';

class WarrantyClaimView extends StatefulWidget {
  const WarrantyClaimView({Key? key}) : super(key: key);

  @override
  _WarrantyClaimViewState createState() => _WarrantyClaimViewState();
}

class _WarrantyClaimViewState extends State<WarrantyClaimView> {
  // Initial Selected Value
  String dropdownvalue = 'Select the Reason';
  bool isApprove = false;

  // List of items in our dropdown menu
  var items = [
    'Select the Reason',
    'Damaged terminals',
    'Faulty shells',
    'Not charging',
    'Charge not retained  ',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          //Title Bar View
          Container(
            height: size.height * 0.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [blue800, darkblue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.045),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                    height: size.height * 0.05,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        setState(() {
                          titleBarText = 'Home';
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.05,
                      child: Center(
                        child: Text(
                          titleBarText,
                          style: TextStyle(
                            color: white,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ), //Body starts here
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.05,
                      left: size.width * 0.05,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 8),
                            color: darkblue.withOpacity(0.5),
                          ),
                        ],
                      ),
                      height: size.height * 0.35,
                      width: size.width * 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Old Battery Serial No',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimSNo,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Battery Model',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimModel,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Old Battery Warranty\nActivated Date',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimWarrantyActivatedDate.split(" ")[0],
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Warranty Expiration Date',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimExpireDate,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimAddress,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Mobile Number',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimMobileNo,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Vehicle Model',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimVehicleType,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.05,
                      left: size.width * 0.05,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 8),
                            color: darkblue.withOpacity(0.5),
                          ),
                        ],
                      ),
                      height: size.height * 0.45,
                      width: size.width * 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.1,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    PermissionStatus status = await _getCameraPermission();
                                    if (status.isGranted) {
                                      qrStatus = '';
                                      titleBarText = 'warrantyClaimScan';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const QRViewExample()),
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [blue800, darkblue],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                                      child: Text(
                                        'Scan QR Code',
                                        style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context).size.height * 0.018,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    openManualInputDialog();
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [blue800, darkblue],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                                      child: Text(
                                        'Manual Enter',
                                        style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context).size.height * 0.018,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'New Battery Serial No',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimNewBatterySNo,
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'New Battery Warranty\nActivated Date',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    wClaimNewBatteryWarrantyStartDate.split(" ")[0],
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Return Reason',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Expanded(
                                    child: DropdownButton(
                                      value: dropdownvalue,
                                      //icon: const Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                          wClaimReturnReson = newValue;
                                          print(wClaimReturnReson);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Remark',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.669,
                                    height: 15,
                                    child: TextField(
                                      controller: remark,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Remark',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            SizedBox(
                              height: size.height * 0.06,
                              child: GestureDetector(
                                onTap: () async {
                                  if (wClaimNewBatterySNo.isNotEmpty) {
                                    await confirmDialog("Do you want to proceed the warrant claim?");
                                    if (isApprove) {
                                      wClaimRemark = remark.text;
                                      wClaimWarrantyActivation = 'Claim submitted';

                                      FirebaseFirestore _firestore = FirebaseFirestore.instance;
                                      String docId = '';
                                      Map<String, dynamic> warrantyMap2;

                                      WarrantyActivation().createWarranty(
                                        wClaimNewBatterySNo,
                                        wClaimModel,
                                        wClaimNewBatteryWarrantyStartDate,
                                        wClaimExpireDate,
                                        wClaimAddress,
                                        wClaimMobileNo,
                                        wClaimVehicleType,
                                        wClaimWarrantyActivation,
                                      );
                                      WarrantyClaim().claim(
                                        wClaimSNo,
                                        wClaimNewBatterySNo,
                                        wClaimModel,
                                        wClaimWarrantyActivatedDate,
                                        wClaimNewBatteryWarrantyStartDate.split(' ').first,
                                        wClaimExpireDate,
                                        wClaimAddress,
                                        wClaimMobileNo,
                                        wClaimVehicleType,
                                        wClaimReturnReson,
                                        wClaimRemark,
                                        wClaimStatus,
                                      );
                                      remark.clear();
                                      await _firestore.collection(wClaimNewBatterySNo.substring(0, 4)).where("sNo", isEqualTo: wClaimNewBatterySNo).get().then((value) {
                                        warrantyMap2 = value.docs[0].data();
                                        print(warrantyMap2['id']);
                                        docId = warrantyMap2['id'].toString();
                                      });
                                      final deleteRecord = FirebaseFirestore.instance.collection(wClaimNewBatterySNo.substring(0, 4)).doc(docId);
                                      deleteRecord.delete();

                                      confirmationDialog('Warranty Claim added successfully');
                                    } else {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }
                                  } else {
                                    validateDialog('Serial number cannot be empty');
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [blue800, darkblue],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  width: size.width * 0.5,
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future openManualInputDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      titleBarText = 'Home';
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: serialNo,
                  decoration: const InputDecoration(
                    hintText: 'Enter Serial Number',
                    labelText: 'Serial Number',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () async {
                    if (serialNo.text.length != 16) {
                      validateDialog('Please enater a valid serial number');
                    } else {
                      Map<String, dynamic> warrantyMap;
                      String nowDate = DateTime.now().toString().split(" ")[0];
                      FirebaseFirestore _firestore = FirebaseFirestore.instance;
                      try {
                        await _firestore.collection('ActivatedWarranty').where("sNo", isEqualTo: serialNo.text).get().then((value) {
                          warrantyMap = value.docs[0].data();
                          validateDialog('Already activated warranty for this battery');
                        });
                      } catch (e) {
                        setState(() {
                          wClaimNewBatterySNo = serialNo.text;
                          wClaimNewBatteryWarrantyStartDate = nowDate;
                        });

                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [blue800, darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future validateDialog(String? massege) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
            child: Column(
              children: [
                Text(
                  'Note!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  massege!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [blue800, darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.011),
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future confirmationDialog(String? massege) => showDialog(
      context: context,
      builder: (context) {
        Timer(const Duration(seconds: 3), () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                Text(
                  'Note!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  massege!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        );
      });

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  Future confirmDialog(String? massege) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
            child: Column(
              children: [
                Text(
                  'Note!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  massege!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.09,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isApprove = true;
                        });
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [blue800, darkblue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.011),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height * 0.022,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isApprove = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [red, darkred],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.011),
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height * 0.022,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
