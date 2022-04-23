import 'package:flutter/material.dart';

import '../controller/dbManager_notifications.dart';
import '../support/colors.dart';
import '../support/global.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  List notificationList = [];

  @override
  void initState() {
    super.initState();
    print('fetched');
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic results = await DBManagerNotificationList().getProductList();

    if (results == null) {
      print("unable to retrieve");
    } else {
      setState(() {
        notificationList = results;
      });
      print(notificationList[0]);
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
                          'Notifications',
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
              itemCount: notificationList.length,
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
                          notificationList[index]['type'],
                          style: TextStyle(fontSize: size.height * 0.02),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          notificationList[index]['subject'],
                          style: TextStyle(fontSize: size.height * 0.03),
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            notificationList[index]['messege'],
                            style: TextStyle(fontSize: size.height * 0.02),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 20,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.65,
                              ),
                              Text(
                                notificationList[index]['createdTime'],
                                style: TextStyle(fontSize: size.height * 0.015),
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
