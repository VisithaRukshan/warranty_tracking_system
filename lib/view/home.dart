import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: white,
                      ),
                      onPressed: () {},
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            titleBarText = 'Active Warranty';
                            print("Tapped 01");
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
                                    'Active\nWarranty',
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
                            titleBarText = 'Claim Warranty';
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
                                    Icons.more_time_rounded,
                                    size: size.height * 0.075,
                                    color: white,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    'Claim\nWarranty',
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
                                    Icons.local_grocery_store_rounded,
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
