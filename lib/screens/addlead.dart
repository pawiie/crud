import 'package:flutter/material.dart';
import 'package:crud/form.dart';

class AddLead extends StatefulWidget {
  // for named routes
  static const String id = 'addlead';
  @override
  _AddLeadState createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Lead',
          style:TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // UserForm in form.dart
            UserForm(),
          ],
        )
      ),
    );
  }
}

