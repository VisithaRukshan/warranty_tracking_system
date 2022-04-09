import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:warranty_tracking_system/controller/warranty_activation_controller.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class WArrantyActivationView extends StatefulWidget {
  const WArrantyActivationView({Key? key}) : super(key: key);

  @override
  _WArrantyActivationViewState createState() => _WArrantyActivationViewState();
}

class _WArrantyActivationViewState extends State<WArrantyActivationView> {
  DateTime selectedDate = DateTime.now();
  TextEditingController address = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController vehicleModel = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        currentDate = picked.toString();

        var model = sNo.substring(0, 4);

        switch (model) {
          case 'E001':
            {
              batModel = 'MF001';
              var now = picked;
              warrantyExpireDate = DateTime(now.year + e001, now.month, now.day);
            }
            break;

          case 'E002':
            {
              batModel = 'MF002';
              var now = picked;
              warrantyExpireDate = DateTime(now.year + e002, now.month, now.day);
            }
            break;

          case 'E003':
            {
              batModel = 'MF003';
              var now = picked;
              warrantyExpireDate = DateTime(now.year + e003, now.month, now.day);
            }
            break;

          case 'E004':
            {
              batModel = 'MF004';
              var now = picked;
              warrantyExpireDate = DateTime(now.year + e004, now.month, now.day);
            }
            break;
        }
      });
    }
  }

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
                      height: size.height * 0.8,
                      width: size.width * 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.04,
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Serial No:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                sNo,
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Battery Model:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                batModel,
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Warranty Activation Date:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    currentDate.split(" ")[0],
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    icon: Icon(
                                      Icons.date_range_rounded,
                                      size: size.height * 0.03,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Warranty Expiration Date:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                warrantyExpireDate.toString().split(" ")[0],
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Address:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: address,
                              decoration: InputDecoration(
                                hintText: 'Address',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blue800),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: green),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mobile Number:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: contactNo,
                              decoration: InputDecoration(
                                hintText: 'Mobile No.',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blue800),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: green),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Vehicle Model:',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: vehicleModel,
                              decoration: InputDecoration(
                                hintText: 'Vehicle Model',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blue800),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: green),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            SizedBox(
                              height: size.height * 0.06,
                              child: GestureDetector(
                                onTap: () {
                                  WarrantyActivation().createWarranty(sNo, batModel, currentDate, warrantyExpireDate.toString(), address.text, contactNo.text, vehicleModel.text);
                                  setState(() {
                                    address.clear();
                                    contactNo.clear();
                                    vehicleModel.clear();
                                  });

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  setState(() {
                                    titleBarText = 'Home';
                                  });
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
                                    'Activate',
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
