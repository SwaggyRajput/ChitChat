// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, unused_import, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types

import 'package:chitchat/Authorization/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chitchat/Screen/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Map<String, dynamic> userMap;
 var name='';
  var email = TextEditingController();
  var password = TextEditingController();
  void setPrefs(String name)async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);
  }
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection("chitchat")
        .where("email", isEqualTo: email.text)
        .get()
        .then((value) => {
              setState(() {
                userMap = value.docs[0].data();
                print(userMap);
                name = userMap['name'];
                print(name);
                setPrefs(name);
              })
            });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ChitChat")),
      ),
      body: isLoading
          ? Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Email",
                    ),
                    controller: email,
                  ),
                ),
                Container(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Password",
                    ),
                    controller: password,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        login(email.text, password.text).then((user) async {
                          if (user != null) {
                            print("Login successfull");
                            onSearch();

                            // setPref(name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen(name)));
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            print("Login Failed");
                          }
                        });
                      } else {
                        print("Please fill form corectly");
                      }
                    },
                    child: Text("Login"))
              ],
            )),
    );
  }
}

