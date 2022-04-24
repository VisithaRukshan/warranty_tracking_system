import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/controller/dbManager_product_list.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List productList = [];

  @override
  void initState() {
    super.initState();
    print('fetched');
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic results = await DBManagerProductList().getProductList();

    if (results == null) {
      print("unable to retrieve");
    } else {
      setState(() {
        productList = results;
      });
      print(productList[0]);
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
          //Body starts here
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(size.height * 0.01),
                  shadowColor: darkblue,
                  child: ListTile(
                    // title:
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productList[index]['productName'],
                          style: TextStyle(fontSize: size.height * 0.022),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          productList[index]['productID'],
                          style: TextStyle(fontSize: size.height * 0.02),
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
                                productList[index]['price'],
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
                                productList[index]['cashDiscount'] + "%",
                                style: TextStyle(fontSize: size.height * 0.02),
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                              ),
                              Text(
                                'Credit Discount :',
                                style: TextStyle(fontSize: size.height * 0.02),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                productList[index]['creditDiscount'] + "%",
                                style: TextStyle(fontSize: size.height * 0.02),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
