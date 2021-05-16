import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:crud/database/db_helper.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  // storing input field data
  String _name;
  String _phone;
  String _dob;

  // global key for validating the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
            onChanged: (value) {
              _name = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
            onChanged: (value) {
              _phone = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid phone number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'DD/MM/YYYY',
              labelText: 'Date of Birth',
            ),
            onChanged: (value) {
              _dob = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid date';
              }
              return null;
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {

                      // If the form is valid, display a Snackbar.
                      int a = await DbHelper.instance.insert(
                          {
                            DbHelper.name : _name,
                            DbHelper.phone : _phone,
                            DbHelper.dob : _dob
                          }
                      );
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          a!= -1 ?'Lead Added' : 'Could Not Add',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ));

                      // print("id is $a");

                      // pop after the query has executed

                      Timer(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
