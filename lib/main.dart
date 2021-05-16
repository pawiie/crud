import 'package:flutter/material.dart';
import 'package:crud/screens/signin.dart';
import 'package:crud/screens/dashboard.dart';
import 'package:crud/screens/addlead.dart';
import 'package:crud/screens/viewlead.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   backgroundColor: Colors.lightBlueAccent
      // ),
      initialRoute: SignIn.id,

      routes: {
        SignIn.id: (context)=>SignIn(),
        Dashboard.id: (context)=>Dashboard(),
        AddLead.id: (context)=> AddLead(),
        ViewLead.id: (context) =>ViewLead()
      },
      debugShowCheckedModeBanner: false,

    );
  }
}

