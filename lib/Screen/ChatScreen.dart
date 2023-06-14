// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, unnecessary_null_comparison, unused_local_variable, unused_import, prefer_const_literals_to_create_immutables

import 'package:chitchat/Authorization/Auth.dart';
import 'package:chitchat/Screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 var namer='';
  
 @override
  void initState() {
    super.initState();
    getValue();
    print(namer);
   
  }
 void getValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      namer = prefs.getString('addfriend').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
                   leading: CircleAvatar(
            child: Icon(Icons.person),
                      ),
          title: Text(namer),
          subtitle:Text('Online') ,
         trailing:  ElevatedButton.icon(
        
            onPressed: () {},
  icon: Icon( // <-- Icon
    Icons.call,
    size: 24.0,
  ),
  label: Text(''), // <-- Text
),
          )
      ),
      body: 
            Column(
        mainAxisAlignment: MainAxisAlignment.end,
             children: [
           
                   
                                  TextField(
                              decoration: InputDecoration(
                  hintText: "send message",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.send)

                              ))
             ]
       )
    );
  }
}