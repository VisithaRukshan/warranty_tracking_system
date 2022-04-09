import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class WarrantyValidationView extends StatefulWidget {
  const WarrantyValidationView({Key? key}) : super(key: key);

  @override
  _WarrantyValidationViewState createState() => _WarrantyValidationViewState();
}

class _WarrantyValidationViewState extends State<WarrantyValidationView> {
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
                                wClaimSNo,
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
                                wClaimModel,
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
                              child: Text(
                                wClaimWarrantyActivatedDate,
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                ),
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
                                wClaimExpireDate,
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
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                wClaimAddress,
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
                                'Mobile Number:',
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
                                wClaimMobileNo,
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
                                'Vehicle Model:',
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
                                wClaimVehicleType,
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
                                'Warranty Status',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            if (wClaimWithinWarranty == 'Within warranty') ...[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  wClaimWithinWarranty,
                                  style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    color: green,
                                  ),
                                ),
                              ),
                            ] else ...[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  wClaimWithinWarranty,
                                  style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            SizedBox(
                              height: size.height * 0.06,
                              child: GestureDetector(
                                onTap: () {
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
}
