// // ignore_for_file: file_names

// ignore_for_file: avoid_print, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Account created succesfully");
      await _firestore.collection("chitchat").doc(_auth.currentUser?.uid).set({
        "name": name,
        "email": email,
        "password": password,
        "status": "Offline"
      });
      return user;
    } else {
      print("Account creation Failed");
      return user;
    }
  } catch (e) {
    // print("Error");
    print(e);
    return null;
  }
}

Future<User?> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Login successful");
    } else {
      print("Login failed");
    }
    return user;
  } catch (e) {
    print("Error");
    return null;
  }
}

Future LogOut() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();
  } catch (e) {
    print("Error");
  }
}


Future<void>? addFriend(String name, String email, String password){
  // FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
   
    return  _firestore.collection("friend").add({
        "name": name,
        "email": email,
        "password": password,
        "status": "Offline"
      });
  } catch (e) {
    // print("Error");
    print(e);
    return null;
  }
}


// Future<void> editFriend(String name,String id) async {
//     FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   return await _firestore.collection('user').doc(id)
//       .updateData({'name':name});
// }