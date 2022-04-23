import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';

class WarrantyActivationReportView extends StatefulWidget {
  const WarrantyActivationReportView({Key? key}) : super(key: key);

  @override
  _WarrantyActivationReportViewState createState() => _WarrantyActivationReportViewState();
}

class Record {
  final String sNo;
  final String model;
  final String activationDate;
  final String warrantyExpireDate;
  final String mobileNo;
  final String address;
  final String vehicleModel;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['sNo'] != null),
        assert(map['model'] != null),
        assert(map['activationDate'] != null),
        assert(map['warrantyExpireDate'] != null),
        assert(map['mobileNo'] != null),
        assert(map['address'] != null),
        assert(map['vehicleModel'] != null),
        sNo = map['sNo'],
        model = map['model'],
        activationDate = map['activationDate'],
        warrantyExpireDate = map['warrantyExpireDate'],
        mobileNo = map['mobileNo'],
        address = map['address'],
        vehicleModel = map['vehicleModel'];

  Record.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  @override
  String toString() => "Record<$sNo:$model:$activationDate:$warrantyExpireDate:$mobileNo:$address:$vehicleModel>";
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
            height: size.height * 0.01,
          ),
          //Body starts here
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('ActivatedWarranty').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();

        return Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: [
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
                rows: _buildList(context, snapshot.data!.docs),
              ),
            ),
          ),
        );
      },
    );
  }

  List<DataRow> _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    print(record);

    return DataRow(cells: [
      DataCell(Text(record.model)),
      DataCell(Text(record.sNo)),
      DataCell(Text(record.activationDate)),
      DataCell(Text(record.warrantyExpireDate)),
      DataCell(Text(record.mobileNo)),
      DataCell(Text(record.address)),
      DataCell(Text(record.vehicleModel)),
    ]);
  }
}
