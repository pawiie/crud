import 'package:flutter/material.dart';

// admin class for  details
class Admin {
   String _userid;
   String _password;

   Admin(){
     this._userid="ps_chauhan";
     this._password="Pawan@01";
   }


  void setDetails(String id, String pass){
    this._userid=id;
    this._password=pass;
  }

  // returning the details
  Map<String,String> getDetails(){
     return {'userid':this._userid,'password':this._password};
  }
}