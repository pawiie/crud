import 'package:flutter/material.dart';
import 'package:crud/screens/addlead.dart';
import 'package:crud/screens/viewlead.dart';


class Dashboard extends StatefulWidget {
  // for named routes
  static const String id='dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("DASHBOARD",
        style:TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, AddLead.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      "Add Lead",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, ViewLead.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      "View Leads",
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
