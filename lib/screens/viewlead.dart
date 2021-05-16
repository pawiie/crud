import 'package:flutter/material.dart';
import 'package:crud/database/db_helper.dart';

class ViewLead extends StatefulWidget {
  // for named routes
  static const String id = 'viewlead';
  @override
  _ViewLeadState createState() => _ViewLeadState();
}

class _ViewLeadState extends State<ViewLead> {

  List< Map<String,dynamic> > queryRow;
  int querySize = 0;

  @override
  void initState(){
    getRows();
    super.initState();
  }

  void getRows() async{
    List< Map<String,dynamic> > temp = await DbHelper.instance.queryall();
    setState(() {
      queryRow = temp;
      querySize = queryRow.length;
    });

    // print(queryRow);
    // print(querySize);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ALL LEADS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Table(
              // defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.lightBlueAccent, style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: [

                  Column(children: [
                    Text('Name', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500))
                  ]),
                  Column(children: [
                    Text('Phone', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500))
                  ]),
                  Column(children: [
                    Text('DOB', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500))
                  ]),
                ]),

                for(int i=0; i<querySize;i++) buildTableRow(queryRow[i]),

                
              ],
            )
          ],
        ),
      ),
    );
  }
  // Map<String,dynamic> currRow

  TableRow buildTableRow(Map<String,dynamic> row) {
    return TableRow(children: [
                Column(children: [Text(row["Name"], style: TextStyle(fontSize: 20),)]),
                Column(children: [Text(row["PhoneNumber"], style: TextStyle(fontSize: 20))]),
                Column(children: [Text(row["DateofBirth"], style: TextStyle(fontSize: 20))]),
              ]);
  }
}
