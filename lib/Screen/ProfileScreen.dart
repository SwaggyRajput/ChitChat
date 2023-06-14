// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, prefer_const_constructors, unused_local_variable, dead_code, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, avoid_print, empty_constructor_bodies, must_be_immutable, unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'AddFriendScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  String namer ;
   ProfileScreen(this.namer);
   
  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  
  @override
  void initState() {
    super.initState();
    getValue();
    // print(namer);
  }

  void getValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      final String namer = prefs.getString('name').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text("ChitChat")),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.logout_outlined)
                ),
                
          ],
        ),
      ),
      body: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Hello ${widget.namer}',style: TextStyle(fontSize: 40),)),
            Container(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.chat),
            )

          ],
        ),
      )
    );
  }
}
