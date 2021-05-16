import 'package:flutter/material.dart';
import 'package:crud/constants.dart';
import 'package:crud/screens/dashboard.dart';
import 'package:crud/database/admin.dart';


class SignIn extends StatefulWidget {
  // for named routes
  static const String id = 'sigin_screen';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // store the input field details
  String userId;
  String userPassword;
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container(
              //   height: 200.0,
              //   child: Image.asset('images/logo.png'),
              // ),
            Text(result!=null ? result : "",
              style: TextStyle(fontSize: 20,color: Colors.red),
              textAlign: TextAlign.center,
            ),
              SizedBox(height: 20.0,),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
            decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Id"),
              onChanged: (value){
                userId = value;
              },
        ),
           SizedBox(height: 20.0,),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              obscureText: true,
              // decorating text field constant created in constants.dart file
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Password"),
              onChanged: (value){
                userPassword = value;
              },
            ),
              SizedBox(height: 25.0,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30.0),

            // signin button
            child: MaterialButton(
              onPressed: (){
                // getting admin details
                Map<String ,String> details = Admin().getDetails();

                // authenticating details
                if( details['userid']==userId && details['password']==userPassword){
                  setState(() {
                    result = "";
                  });
                  Navigator.pushNamed(context, Dashboard.id);
                }
                else{
                  setState(() {
                    result='wrong credentials';
                  });
                }

              },
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
    ],
        ),
      ),
    );

  }
}
