import 'package:flutter/material.dart';
import 'package:warranty_tracking_system/support/colors.dart';
import 'package:warranty_tracking_system/support/global.dart';
import 'package:warranty_tracking_system/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [blue800, darkblue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: const Center(
                child: Image(
              image: AssetImage('assets/logo_300x300.png'),
            )),
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
                      left: size.width * 0.15,
                      right: size.width * 0.15,
                    ),
                    child: SizedBox(
                      height: size.height * 0.54,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: blue800.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: gray100),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_outline_rounded),
                                    border: InputBorder.none,
                                    hintText: "User Name",
                                    hintStyle: TextStyle(
                                      color: gray400,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: darkblue.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: gray100,
                                  ),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: gray400,
                                  ),
                                ),
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                            ),
                            child: GestureDetector(
                              child: Container(
                                height: size.height * 0.08,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [blue800, darkblue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                titleBarText = 'Home';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomeView()),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                          ),
                          Center(
                            child: Text(
                              "v1.0.0",
                              style: TextStyle(
                                color: gray400,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "All rights reserved",
                              style: TextStyle(
                                color: gray400,
                              ),
                            ),
                          )
                        ],
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
