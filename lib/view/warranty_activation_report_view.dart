import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class WarrantyActivationReportView extends StatefulWidget {
  const WarrantyActivationReportView({Key? key}) : super(key: key);

  @override
  _WarrantyActivationReportViewState createState() => _WarrantyActivationReportViewState();
}

class _WarrantyActivationReportViewState extends State<WarrantyActivationReportView> {
  String dropdownValue1 = 'Select Battery Code';
  String dropdownValue2 = 'Date Range';

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
                          titleBarText = 'Reports';
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.05,
                      child: Center(
                        child: Text(
                          'Warranty Activation Report',
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
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.99,
            height: size.height * 0.12,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(size.height * 0.009),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.height * 0.015),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue1,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 1,
                        color: Colors.black38,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue1 = newValue!;
                        });
                      },
                      items: <String>['Select Battery Code'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                
                ),
              SizedBox(
                  width: size.width * 0.01,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(size.height * 0.009),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.height * 0.015),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 1,
                        color: Colors.black38,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: <String>['Date Range'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                
                )
              ],
            ),
          ),

          SizedBox(
            height: size.height * 0.01
            ,
          ),
          //Body starts here
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: size.width * 0.05,
                        left: size.width * 0.05,
                      ),
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Model',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Serial No.',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Warranty Start\nDate',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Warranty End\nDate',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Contact No.',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Address',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Vehicle Model',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(
                                Text('MF001'),
                              ),
                              DataCell(
                                Text('E001236524587965'),
                              ),
                              DataCell(
                                Text('2022-02-03'),
                              ),
                              DataCell(
                                Text('2023-02-03'),
                              ),
                              DataCell(
                                Text('0987654321'),
                              ),
                              DataCell(
                                Text('Colombo'),
                              ),
                              DataCell(
                                Text('Car'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text('MF001'),
                              ),
                              DataCell(
                                Text('E001236524587965'),
                              ),
                              DataCell(
                                Text('2022-02-03'),
                              ),
                              DataCell(
                                Text('2023-02-03'),
                              ),
                              DataCell(
                                Text('0987654321'),
                              ),
                              DataCell(
                                Text('Colombo'),
                              ),
                              DataCell(
                                Text('Car'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text('MF001'),
                              ),
                              DataCell(
                                Text('E001236524587965'),
                              ),
                              DataCell(
                                Text('2022-02-03'),
                              ),
                              DataCell(
                                Text('2023-02-03'),
                              ),
                              DataCell(
                                Text('0987654321'),
                              ),
                              DataCell(
                                Text('Colombo'),
                              ),
                              DataCell(
                                Text('Car'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text('MF001'),
                              ),
                              DataCell(
                                Text('E001236524587965'),
                              ),
                              DataCell(
                                Text('2022-02-03'),
                              ),
                              DataCell(
                                Text('2023-02-03'),
                              ),
                              DataCell(
                                Text('0987654321'),
                              ),
                              DataCell(
                                Text('Colombo'),
                              ),
                              DataCell(
                                Text('Car'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text('MF001'),
                              ),
                              DataCell(
                                Text('E001236524587965'),
                              ),
                              DataCell(
                                Text('2022-02-03'),
                              ),
                              DataCell(
                                Text('2023-02-03'),
                              ),
                              DataCell(
                                Text('0987654321'),
                              ),
                              DataCell(
                                Text('Colombo'),
                              ),
                              DataCell(
                                Text('Car'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
