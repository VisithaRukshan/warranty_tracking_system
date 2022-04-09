import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';
import 'package:warranty_tracking_system/support/qr_code_reader.dart';
import 'package:warranty_tracking_system/view/product_view.dart';
import 'package:warranty_tracking_system/view/reports_view.dart';
import 'package:warranty_tracking_system/view/stock_view.dart';
import 'package:warranty_tracking_system/view/warranty_activation_view.dart';
import 'package:warranty_tracking_system/view/warranty_claim_view.dart';

import 'warranty_validation_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var validate = false;

  TextEditingController serialNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
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
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.05,
                      child: Center(
                        child: Text(
                          'Home',
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
            height: size.height * 0.05,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.09,
                      left: size.width * 0.09,
                    ),
                    child: Column(
                      children: [
                        //first row

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                titleBarText = 'Warranty Activation';
                                qrStatus = '';
                                print("tapped 1");
                                openDialog();
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.date_range_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Warranty\nActivation',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.033,
                            ),
                            GestureDetector(
                              onTap: () {
                                titleBarText = 'Warranty Claim';
                                qrStatus = '';
                                wClaimNewBatterySNo = '';
                                wClaimNewBatteryWarrantyStartDate = '';
                                wClaimRemark = '';
                                print("tapped 2");
                                openDialog();
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.replay_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Warranty\nClaim',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.033,
                            ),
                            GestureDetector(
                              onTap: () {
                                titleBarText = 'Warranty Validation';
                                qrStatus = '';
                                print("tapped 3");
                                openDialog();
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.more_time_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Warranty\nValidation',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),

                        //second row

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                titleBarText = 'Warranty Reversal';
                                qrStatus = '';
                                openDialog();
                                print("tapped Warranty Reversal");
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.loop_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Warranty\nReversal',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.033,
                            ),
                            GestureDetector(
                              onTap: () {
                                titleBarText = 'Stock';
                                stockDialog();
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Stock',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.033,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProductView()),
                                );
                                setState(() {
                                  titleBarText = 'Products';
                                });
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.shopping_bag_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Products',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.03,
                        ),

                        //third row

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("tapped Report");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ReportsView()),
                                );
                                setState(() {
                                  titleBarText = 'Products';
                                });
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.assignment_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Reports',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.033,
                            ),
                            /*       GestureDetector(
                              onTap: () {
                                titleBarText = 'Stock';
                                print("Tapped 02");
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Stock',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.033,
                            ),
                            GestureDetector(
                              onTap: () {
                                titleBarText = 'Products';
                                print("Tapped 03");
                              },
                              child: Container(
                                height: size.height * 0.175,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.shopping_bag_rounded,
                                        size: size.height * 0.075,
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        'Products',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          */
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
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
                GestureDetector(
                  onTap: () async {
                    PermissionStatus status = await _getCameraPermission();
                    if (status.isGranted) {
                      qrStatus = '';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QRViewExample()),
                      );
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [blue800, darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),
                      child: Text(
                        'Scan QR Code',
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
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    qrStatus = '';
                    setState(() {
                      print('validate');
                      validate = false;
                      serialNo.clear();
                    });
                    openManualInputDialog();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [blue800, darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),
                      child: Text(
                        'Manual Enter',
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

  Future stockDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
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
                GestureDetector(
                  onTap: () async {
                    titleBarText = 'Stock';
                    // openDialog();
                    // PermissionStatus status = await _getCameraPermission();
                    // if (status.isGranted) {
                    //   titleBarText = 'Stock Taking';
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const QRViewExample()),
                    //   );
                    // }
                    qrStatus = '';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QRViewExample()),
                      );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [blue800, darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),
                      child: Text(
                        'Stock Taking',
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
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () async {
                    FirebaseFirestore _firestore = FirebaseFirestore.instance;

                    await _firestore.collection("E001").get().then((value) {
                      setState(() {
                        e001Count = value.size.toString();
                      });
                    });

                    await _firestore.collection("E002").get().then((value) {
                      setState(() {
                        e002Count = value.size.toString();
                      });
                    });

                    await _firestore.collection("E003").get().then((value) {
                      setState(() {
                        e003Count = value.size.toString();
                      });
                    });

                    await _firestore.collection("E004").get().then((value) {
                      setState(() {
                        e004Count = value.size.toString();
                      });
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StockView()),
                    );
                    setState(() {
                      titleBarText = 'Stock View';
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [blue800, darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.022),
                      child: Text(
                        'Stock View',
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
                      if (titleBarText == 'Warranty Validation' || titleBarText == 'Warranty Reversal' || titleBarText == 'Warranty Claim') {
                        try {
                          await _firestore.collection('ActivatedWarranty').where("sNo", isEqualTo: serialNo.text).get().then((value) {
                            warrantyMap = value.docs[0].data();
                            print(warrantyMap);
                            wClaimid = warrantyMap['id'];
                            wClaimSNo = warrantyMap['sNo'];
                            wClaimModel = warrantyMap['model'];
                            wClaimWarrantyActivatedDate = warrantyMap['activationDate'];
                            wClaimExpireDate = warrantyMap['warrantyExpireDate'];
                            wClaimAddress = warrantyMap['address'];
                            wClaimMobileNo = warrantyMap['mobileNo'];
                            wClaimVehicleType = warrantyMap['vehicleModel'];

                            if (wClaimExpireDate.compareTo(nowDate) > 0) {
                              wClaimWithinWarranty = 'Within warranty';
                            } else {
                              wClaimWithinWarranty = 'Warranty Expired';
                            }
                          });

                          if (titleBarText == 'Warranty Validation') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const WarrantyValidationView()),
                            );
                          } else if (titleBarText == 'Warranty Claim') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const WarrantyClaimView()),
                            );
                          } else {
                            validateDialog('Do you need to reverse the warranty?');
                          }
                        } catch (e) {
                          validateDialog('Please enater a valid serial number');
                        }
                      } else {
                        try {
                          await _firestore.collection('ActivatedWarranty').where("sNo", isEqualTo: serialNo.text).get().then((value) {
                            warrantyMap = value.docs[0].data();
                            validateDialog('Already activated warranty for this battery');
                          });
                        } catch (e) {
                          sNo = serialNo.text;
                          activationDetails(serialNo.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WArrantyActivationView()),
                          );
                        }
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
            height: MediaQuery.of(context).size.height * 0.17,
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
                    if (massege == 'Do you need to reverse the warranty?') {
                      final deleteRecord = FirebaseFirestore.instance.collection('ActivatedWarranty').doc(wClaimid);
                      deleteRecord.delete();
                      validateDialog('Warranty reversal completed');
                    } else if (massege == 'Warranty reversal completed') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
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

  void activationDetails(String sNo) {
    var model = sNo.substring(0, 4);

    switch (model) {
      case 'E001':
        {
          batModel = 'MF001';
          var now = DateTime.now();
          warrantyExpireDate = DateTime(now.year + e001, now.month, now.day);
        }
        break;

      case 'E002':
        {
          batModel = 'MF002';
          var now = DateTime.now();
          warrantyExpireDate = DateTime(now.year + e002, now.month, now.day);
        }
        break;

      case 'E003':
        {
          batModel = 'MF003';
          var now = DateTime.now();
          warrantyExpireDate = DateTime(now.year + e003, now.month, now.day);
        }
        break;

      case 'E004':
        {
          batModel = 'MF004';
          var now = DateTime.now();
          warrantyExpireDate = DateTime(now.year + e004, now.month, now.day);
        }
        break;
    }
  }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }
}
