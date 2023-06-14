// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, unnecessary_null_comparison, unused_local_variable, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, prefer_final_fields, unused_field

import 'package:chitchat/Authorization/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chitchat/Screen/FriendScreen.dart';
import 'package:chitchat/Screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFriendScreen extends StatefulWidget {
  @override
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  late Map<String, dynamic> userMap;
  var named='';
  var _email='';
  var password='';
  var showfriend=false;
 var email = TextEditingController();
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
                named = userMap['name'];
               _email = userMap['email'];
                password = userMap['password'];
                print(named);
                
              })
            });
  }
 

  //  void setPrefs()async{

  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('addfriend', name);
  // }
//   void changeshowfriend() {
//     useState
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ChitChat"),
            ElevatedButton(onPressed: (){
              setState(() {
                showfriend=false;
              });
            //  changeshowfriend();
             Navigator.push(context, 
             MaterialPageRoute(builder: (context)=>FriendScreen())
             );

            },
             child: 
             Text("FriendList",textDirection: TextDirection.ltr,)
             )
          ],
        )
      ),
      body:
      Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0,0),
                // width:200 ,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Search Friend",
                    
                    
              
                  ),
                ),
              ),
             SizedBox(
              height: 20,
             )
              ,
              ElevatedButton(onPressed: (){
                 onSearch();
                 setState(() {
                    showfriend=true;
                 });
                
                 
              },
               child: Text("Search")
               ),
               SizedBox(
                height: 20,
               ),
             
                       ],
          ),
          Visibility(
            visible: showfriend,
            child: Column(
              
              children: [
              ListTile(
                
                     leading: CircleAvatar(
              child: Icon(Icons.person),
                        ),
            title: Text(named),
            subtitle:Text('Online') ,
                   trailing:  ElevatedButton.icon(
                  
              onPressed: () {
                addFriend(named,_email,password);
                // setPrefs();
              
              },
            icon: Icon( // <-- Icon
              Icons.add,
              size: 24.0,
            ),
            label: Text(''), // <-- Text
          ),
            ),
          //    ListTile(
          //            leading: CircleAvatar(
          //     child: Icon(Icons.person),
          //               ),
          //   title: Text(name),
          //   subtitle:Text('Online') ,
          //          trailing:  ElevatedButton.icon(
                  
          //     onPressed: () {},
          //   icon: Icon( // <-- Icon
          //     Icons.add,
          //     size: 24.0,
          //   ),
          //   label: Text(''), // <-- Text
          // ),
          //   )
              ],
            ),
          )
        ],
      )
           
    );
  }
}

