// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, must_call_super, avoid_unnecessary_containers, unused_import

import 'dart:async';

import 'package:chitchat/Screen/RegisterScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fontsize = 60.0;
  @override
  void initState() {
    super.initState();
  //   Timer(Duration(seconds: 1), () {
  //  setState(() {
  //     fontsize=80.0;
  //  });
  //   });
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
      color: Colors.black,
      duration: Duration(seconds: 1),
      child: Center(
          child: Text(
        "ChitChat",
        style: TextStyle(
            fontSize: fontsize,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold),
      )),
    ));
  }
}
