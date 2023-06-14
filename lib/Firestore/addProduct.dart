// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, unnecessary_new

// import 'package:flutter/material.dart';

// import 'operations.dart';

// class AddUser extends StatefulWidget {
//   static const routeName = 'adduser';
//   @override
//   _AddUserState createState() => _AddUserState();
// }

// class _AddUserState extends State<AddUser> {
//   late String id;
//   TextEditingController productNameController = TextEditingController();
//   TextEditingController productPriceController = TextEditingController();
//   TextEditingController imageUrlController = TextEditingController();
//   late String productName;
//   late String productPrice;
//   late String imageUrl;
//   bool isFavourite = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ADD GADGETS"),
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             decoration: InputDecoration(
//                 focusedBorder: new UnderlineInputBorder(
//                     borderSide: new BorderSide(
//                         color: Colors.green,
//                         width: 2,
//                         style: BorderStyle.solid)),
//                 labelText: "Product Name",
//                 icon: Icon(
//                   Icons.assignment,
//                   color: Colors.orangeAccent,
//                 ),
//                 fillColor: Colors.white,
//                 labelStyle: TextStyle(
//                   color: Colors.green,
//                 )),
//             onChanged: (value) {
//               productName = value;
//             },
//             controller: productNameController,
//           ),
//           TextField(
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//                 focusedBorder: new UnderlineInputBorder(
//                     borderSide: new BorderSide(
//                         color: Colors.green,
//                         width: 2,
//                         style: BorderStyle.solid)),
//                 labelText: "Product Price",
//                 icon: Icon(
//                   Icons.assignment,
//                   color: Colors.orangeAccent,
//                 ),
//                 fillColor: Colors.white,
//                 labelStyle: TextStyle(
//                   color: Colors.green,
//                 )),
//             onChanged: (value) {
//               productPrice = value;
//             },
//             controller: productPriceController,
//           ),
//           TextField(
//             keyboardType: TextInputType.url,
//             decoration: InputDecoration(
//                 focusedBorder: new UnderlineInputBorder(
//                     borderSide: new BorderSide(
//                         color: Colors.green,
//                         width: 2,
//                         style: BorderStyle.solid)),
//                 labelText: "Image URL",
//                 icon: Icon(
//                   Icons.assignment,
//                   color: Colors.orangeAccent,
//                 ),
//                 fillColor: Colors.white,
//                 labelStyle: TextStyle(
//                   color: Colors.green,
//                 )),
//             onChanged: (value) {
//               imageUrl = value;
//             },
//             controller: imageUrlController,
//           ),
//           Row(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, left: 40),
//                 child: ElevatedButton(
                 
//                   child: Text(
//                     "Add",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {
//                     uploadingData(
//                         productName, productPrice, imageUrl, isFavourite);
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }