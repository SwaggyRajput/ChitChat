// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../Authorization/PractiseDatabase.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
    
    var name=TextEditingController();
    var email=TextEditingController();
    var password=TextEditingController();


    void resetTextField(){
      name.clear();
      email.clear();
      password.clear();
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataBase"),
      ),
      body:
       ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Name',
              //  errorText: 'Enter Name',
                errorStyle: TextStyle(color: Colors.red)

              ),
            ),
          ),
          SizedBox(
            height:20,
          ),
            Container(
              margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: email,
decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Email',
              //  errorText: 'Enter Email',
                errorStyle: TextStyle(color: Colors.red)

              ),
            ),
          ),
          SizedBox(
            height:10,
          ),
            Container(
              margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: password,
decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Password',
              //  errorText: 'Enter Password',
                errorStyle: TextStyle(color: Colors.red)

              ),
            ),
          ),
          SizedBox(
            height:10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                addUser(name.text,email.text,password.text);
              },
               child: Text("Register")),
              Text("      ")
               ,
               ElevatedButton(onPressed: (){
                  resetTextField();
              },
               child: Text("Reset")),
            ],
          )
          
        ],
       )
      
    );
  }
}