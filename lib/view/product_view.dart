import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
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
                          'Products',
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
                    child: Column(
                      children: [
                        Container(
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
                          height: size.height * 0.2,
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
                                  child: Text(
                                    productName1,
                                    style: TextStyle(fontSize: size.height * 0.03),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    productId1,
                                    style: TextStyle(fontSize: size.height * 0.02),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Price :',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'Rs.12000.00',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
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
                                        'Cash Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '30%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.04,
                                      ),
                                      Text(
                                        'Credit Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '25%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
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
                          height: size.height * 0.2,
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
                                  child: Text(
                                    productName2,
                                    style: TextStyle(fontSize: size.height * 0.03),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    productId2,
                                    style: TextStyle(fontSize: size.height * 0.02),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Price :',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'Rs.12000.00',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
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
                                        'Cash Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '30%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.04,
                                      ),
                                      Text(
                                        'Credit Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '25%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
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
                          height: size.height * 0.2,
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
                                  child: Text(
                                    productName3,
                                    style: TextStyle(fontSize: size.height * 0.03),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    productId3,
                                    style: TextStyle(fontSize: size.height * 0.02),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Price :',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'Rs.12000.00',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
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
                                        'Cash Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '30%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.04,
                                      ),
                                      Text(
                                        'Credit Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '25%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
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
                          height: size.height * 0.2,
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
                                  child: Text(
                                    productName4,
                                    style: TextStyle(fontSize: size.height * 0.03),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    productId4,
                                    style: TextStyle(fontSize: size.height * 0.02),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Price :',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'Rs.12000.00',
                                        style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
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
                                        'Cash Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '30%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.04,
                                      ),
                                      Text(
                                        'Credit Discount :',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        '25%',
                                        style: TextStyle(fontSize: size.height * 0.02),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
