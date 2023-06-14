// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unused_local_variable

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../Authorization/PractiseDatabase.dart';

// class ShowUserScreen extends StatefulWidget {
//   const ShowUserScreen({super.key});

//   @override
//   State<ShowUserScreen> createState() => _ShowUserScreenState();
// }

// class _ShowUserScreenState extends State<ShowUserScreen> {
  

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users=FirebaseFirestore.instance.collection('user');
//     return StreamBuilder(
//     stream: users.snapshots(),
//     builder: (context, snapshot) {
//         return !snapshot.hasData
//       ? Text('PLease Wait')
//       : ListView.builder(
//           itemCount: snapshot.data!.documents.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot products =
//                 snapshot.data!.documents[index];
//             return ProductItem(
//               name: products['name'],
//               email: products['email'],
//               password: products['password'],
             
//             );
//           },
//         );
// },

//   }
// }

// class ProductItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();

//   }
// }







// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatelessWidget {
  final String documentId;

  ShowUser(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Name: ${data['name']} ${data['email']} ${data['password']}");
        }

        return Text("loading");
      },
    );
  }
}