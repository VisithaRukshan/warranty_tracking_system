import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';
import 'package:warranty_tracking_system/view/warranty_activation_report_view.dart';
import 'package:warranty_tracking_system/view/warranty_claim_report_view.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({Key? key}) : super(key: key);

  @override
  _ReportsViewState createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
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
                          'Reports',
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
            height: size.height * 0.028,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height* 0.35,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WarrantyActivationReportView()),
                                );
                                setState(() {
                                  titleBarText = 'Warranty Activation Report';
                                });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [blue800, darkblue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
                              child: Text(
                                'Warranty Activation Report',
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
                          height: size.height* 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WarrantyClaimReportView()),
                                );
                                setState(() {
                                  titleBarText = 'Warranty Claim Report';
                                });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [blue800, darkblue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
                              child: Text(
                                'Warranty Claim Report',
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
                  SizedBox(
                    height: size.height * 0.03,
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
