import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:warranty_tracking_system/controller/stock_taking_controller.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';
import 'package:warranty_tracking_system/view/warranty_activation_view.dart';
import 'package:warranty_tracking_system/view/warranty_claim_view.dart';
import 'package:warranty_tracking_system/view/warranty_validation_view.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
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
                        if (titleBarText == 'Warranty Activation') {
                          Navigator.pop(context);
                          titleBarText = 'Warranty Activation';
                        }
                        if (titleBarText == 'Warranty Claim') {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          titleBarText = 'Home';
                        }
                        if (titleBarText == 'Warranty Validation') {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          titleBarText = 'Home';
                        }
                        if (titleBarText == 'Stock Taking') {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          titleBarText = 'Home';
                        }
                        if (titleBarText == 'Warranty Reversal') {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          titleBarText = 'Home';
                        }
                        if (titleBarText == 'Warranty Claim') {
                          Navigator.pop(context);
                          titleBarText = 'Warranty Claim';
                        }
                        if (titleBarText == 'Stock') {
                          Navigator.pop(context);
                          titleBarText = 'Stock';
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.05,
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
          Expanded(child: _buildQrView(context)),
          Container(
            height: size.height * 0.05,
            width: size.width * 1,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (result != null)
                  if (qrStatus == 'pass')
                    Container(
                      width: size.width * 0.5,
                      height: size.height * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.greenAccent[700],
                      ),
                      child: Text(
                        'Successfully Scanned\n${result!.code}',
                        textAlign: TextAlign.center,
                      ),
                    )
                  else
                    Container(
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      child: const Text(
                        'Invalid QR Code. Please Scan again',
                        textAlign: TextAlign.center,
                      ),
                    )

                /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
              */
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    Map<String, dynamic> warrantyMap;
    String nowDate = DateTime.now().toString().split(" ")[0];
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code!.length == 16) {
          setState(() {
            qrStatus = 'pass';
          });
        }
        print(result!.code);
        controller.pauseCamera();
        if (qrStatus == 'pass') {
          Future.delayed(const Duration(seconds: 2), () async {
            if (titleBarText == 'Warranty Validation' || titleBarText == 'Warranty Claim') {
              validation(result!.code);
            } else if (titleBarText == 'Warranty Reversal') {
              print('warranty reversal completed');
              validation(result!.code);
            } else if (titleBarText == 'Stock') {
              stockTakingValidation(result!.code);
              controller.resumeCamera();
            } else {
              sNo = result!.code!;
              activationValidation(sNo);
              /* titleBarText = 'Warranty Activation';
              batModel = '';
              activationDetails(sNo);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WArrantyActivationView()),
              );*/
            }
          });
        } else {
          Future.delayed(const Duration(seconds: 2), () {
            controller.resumeCamera();
          });
        }
      });
    });
  }

  void stockTakingValidation(String? code) async {
    Map<String, dynamic> warrantyMap;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String type;

    type = code!.substring(0, 4);

    try {
      await _firestore.collection(type).where("sNo", isEqualTo: code).get().then((value) {
        warrantyMap = value.docs[0].data();
      });
      validateDialog('This battery is already in the stock');
    } catch (e) {
      String nowDate = DateTime.now().toString().split(" ")[0];
      StockTaking().stock(code, nowDate);
      confirmDialog();
    }
  }

  void activationValidation(String? code) async {
    String nowDate = DateTime.now().toString();
    Map<String, dynamic> warrantyMap1;
    Map<String, dynamic> warrantyMap2;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String docId = '';

    try {
      await _firestore.collection('ActivatedWarranty').where("sNo", isEqualTo: code).get().then((value) {
        warrantyMap1 = value.docs[0].data();
      });
      validateDialog('Already activated warranty for this battery');
      controller!.resumeCamera();
    } catch (e) {
      if (titleBarText == 'Warranty Activation') {
        titleBarText = 'Warranty Activation';
        batModel = '';
        activationDetails(sNo);

        await _firestore.collection(sNo.substring(0, 4)).where("sNo", isEqualTo: code).get().then((value) {
          warrantyMap2 = value.docs[0].data();
          //  print(warrantyMap2.values.single('sNo'));
          print(warrantyMap2['id']);
          docId = warrantyMap2['id'].toString();
        });

        final deleteRecord = FirebaseFirestore.instance.collection(sNo.substring(0, 4)).doc(docId);
        deleteRecord.delete();

        // final deleteRecord = await FirebaseFirestore.instance.collection(sNo.substring(0, 4)).where("sNo", isEqualTo: code).get();
        // deleteRecord.delete();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WArrantyActivationView()),
        );
      } else {
        setState(() {
          wClaimNewBatterySNo = code!;
          wClaimNewBatteryWarrantyStartDate = nowDate;
        });
        print(wClaimNewBatterySNo);
        print(wClaimNewBatteryWarrantyStartDate);
        titleBarText = "Warranty Claim";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WarrantyClaimView()),
        );
      }
    }
  }

  void validation(String? code) async {
    Map<String, dynamic> warrantyMap;
    String nowDate = DateTime.now().toString().split(" ")[0];
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await _firestore.collection('ActivatedWarranty').where("sNo", isEqualTo: code).get().then((value) {
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
        wClaimCurrentDateTime = warrantyMap['currentDatTime'];

        if (wClaimExpireDate.compareTo(nowDate) > 0) {
          wClaimWithinWarranty = 'Within warranty';
        } else {
          wClaimWithinWarranty = 'Warranty Expired';
        }
      });

      if (titleBarText == 'Warranty Claim') {
        if (wClaimWithinWarranty == 'Warranty Expired') {
          validateDialog('This battery has been expired warranty');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WarrantyClaimView()),
          );
        }
      }
      if (titleBarText == 'Warranty Validation') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WarrantyValidationView()),
        );
      }

      if (titleBarText == 'Warranty Reversal') {
        print('reversal');
        if (wClaimCurrentDateTime.compareTo(nowDate) > 0) {
          validateDialog(warrantyReversalMsg);
        } else {
          validateDialog('Warranty reversal time period has been expied');
        }
      }
    } catch (e) {
      validateDialog('This Battery has not been activated warranty');
      controller!.resumeCamera();
    }
  }

  Future confirmDialog() => showDialog(
      context: context,
      builder: (context) {
        Timer(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                "Added to the Stock !",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ),
          ),
        );
      });

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
                    if (wClaimWithinWarranty == 'Warranty Expired') {
                      Navigator.pop(context);
                      controller!.resumeCamera();
                    } else if (massege == 'Warranty reversal time period has been expied') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else if (massege == warrantyReversalMsg) {
                      Navigator.pop(context);
                      warrantyReversal(wClaimid, wClaimSNo);
                      validateDialog('Warranty reversal completed');
                    } else if (massege == 'Warranty reversal completed') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
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

  void warrantyReversal(String id, String sNo) async {
    String nowDate = DateTime.now().toString().split(" ")[0];

    StockTaking().stock(sNo, nowDate);

    final deleteRecord = FirebaseFirestore.instance.collection('ActivatedWarranty').doc(id);
    deleteRecord.delete();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
