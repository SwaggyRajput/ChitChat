// // ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, unused_import, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

// ignore_for_file: library_private_types_in_public_api, unused_import, prefer_const_constructors, avoid_unnecessary_containers

import 'package:chitchat/Authorization/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chitchat/Screen/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("ChitChat")),
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, Index) {
                      return null;
                    });
              } else {
                return Container();
              }
            },
            stream: null,
          ),
        ));
  }
}
