// ignore_for_file: file_names, unused_import, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> addUser(String name,String email,String password)async{
     CollectionReference users=FirebaseFirestore.instance.collection('user');
     return await users.add({
      'name':name,
      'email':email,
      'password':password
     }).then((value) {
      print(value);
      print("user added");
     }).catchError((error){
      print("Failed to add user");
     });
}

// deletUser{

// }



// updateUser{

// }



// showUser{

// }



//Queries