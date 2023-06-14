// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, unused_element, prefer_const_constructors, library_private_types_in_public_api, avoid_print, unnecessary_null_comparison, unused_local_variable, unused_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:chitchat/Authorization/Auth.dart';
import 'package:chitchat/Screen/ChatScreen.dart';
import 'package:chitchat/Screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendScreen extends StatefulWidget {
  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
var namer='';
   List<String> Friendcount=[];

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
       Friendcount.add(namer);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Friends"))
      ),
      body:
      // ListView(
      //   children: [
      //      TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text(namer),
      //                subtitle:Text('Online') ,
      //               ),
      //      ),
      //      Divider(),
      //     TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text('HarshSingh'),
      //                subtitle:Text('Online') ,
      //               ),
      //      ), 
      //       Divider(),
      //       TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text('HarshSingh'),
      //                subtitle:Text('Online') ,
      //               ),
      //      ),
      //      Divider(),
      //       TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text('HarshSingh'),
      //                subtitle:Text('Online') ,
      //               ),
      //      ),
      //      Divider(),
      //       TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text('HarshSingh'),
      //                subtitle:Text('Online') ,
      //               ),
      //      ),
      //      Divider(),

      //       TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text('HarshSingh'),
      //                subtitle:Text('Online') ,
      //               ),
      //      ),
      //      Divider(),
      //       TextButton(
      //       onPressed: (){
      //          Navigator.push(context,
      //           MaterialPageRoute(builder: (context)=>ChatScreen())
      //           );
      //       },
      //        child: ListTile(
      //                leading: CircleAvatar(
      //         child: Icon(Icons.person),
      //                   ),
      //                title: Text('HarshSingh'),
      //                subtitle:Text('Online') ,
      //               ),
      //      ),
      //   ],
      // )
      


      ListView.builder(
        itemCount:
        //  10,
        Friendcount.length ,
        itemBuilder: (context,index){
         return  TextButton(
            onPressed: (){
               Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ChatScreen())
                );
            },
             child: ListTile(
                     leading: CircleAvatar(
              child: Icon(Icons.person),
                        ),
                     title: Text(namer),
                     subtitle:Text('Online') ,
                    ),
           );
           
        }
        )
    );
  }
}