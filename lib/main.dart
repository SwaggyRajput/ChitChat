// ignore_for_file: unused_import, use_key_in_widget_constructors, duplicate_import, prefer_const_constructors, unused_local_variable

import 'package:chitchat/PractiseScreen/ShowUser.dart';
import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';
import 'Firestore/addProduct.dart';
import 'Screen/LoginScreen.dart';
import 'PractiseScreen/AddUser.dart';
import 'Screen/RegisterScreen.dart';
import 'Screen/HomeScreen.dart';
import 'Screen/ProfileScreen.dart';
import 'Screen/Chatroom.dart';
import 'Screen/ChatScreen.dart';
import 'Screen/AddFriendScreen.dart';
import 'Screen/FriendScreen.dart';
import 'Firestore/homepage.dart';
import 'PractiseScreen/ShowUser.dart';

Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  
  runApp(
    // CrudFirestore()
  //  ShowUser('pqRVtNMjHtWGPTL0v8Oy');
  ChitChat()
// Text("harsh",textDirection: TextDirection.ltr,)
    );
}

class ChitChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChitChat",
        home: HomeScreen(),
      // home:AddFriendScreen()
      // home: ShowUserScreen(),
      // home: ProfileScreen(),
      
         );
  }
}






// class CrudFirestore extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: HomePage.routeName,
//       routes: {
//         HomePage.routeName:(ctx) =>HomePage(),
//         AddUser.routeName:(ctx) =>AddUser(),
//       },
//     );
//   }
// }