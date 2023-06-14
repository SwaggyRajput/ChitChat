// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, unnecessary_null_comparison, unused_local_variable, unused_import

import 'package:chitchat/Authorization/Auth.dart';
import 'package:chitchat/Screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
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
                      hintText: "Enter Name",
                    ),
                    controller: name,
                  ),
                ),
                Container(height: 10),
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
                      if (name.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          password.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        createAccount(name.text, email.text, password.text)
                            .then((user) async {
                          if (user != null) {
                            setState(() {
                              isLoading = false;
                            });
                            print("Register succesfull");
                          } else {
                            print("Register Failed");
                          }
                        });
                      } else {
                        print("Please Enter Fields");
                      }
                    },
                    child: Text("Register")),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text("Login")),
                ),
              ],
            )),
    );
  }
}
