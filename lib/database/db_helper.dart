import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DbHelper{

  // databsse  details
  static final _dbname = 'leadDatabase.db';
  static final _dbversion = 1;
  static final _tablename = 'leadTable';
  static final columnId = 'ID';
  static final name = 'Name';
  static final phone ='PhoneNumber';
  static final dob = 'DateofBirth';

  // singleton class
  DbHelper._privateConstructor();
  // instance
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database _database ;

  Future<Database> get database async {
    if(_database!=null){
      return _database;
    }
    _database = await _initiateDatabase();

    return _database;
  }

  // initialising database
  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path =join(directory.path,_dbname);

    return await openDatabase(path,version: _dbversion,onCreate: _onCreate);
  }
  //creating database
  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $_tablename (
      $columnId INTEGER PRIMARY KEY,
      $name TEXT,
      $phone TEXT,
      $dob TEXT
      )
      '''
    );
  }
  //inserting into table
  Future<int> insert(Map<String , dynamic> row) async{
    Database db = await instance.database;

    return await db.insert(_tablename, row);
  }

    Future <List <Map <String , dynamic> > > queryall() async{
    Database db = await instance.database;
    return await db.query(_tablename);
  }
}