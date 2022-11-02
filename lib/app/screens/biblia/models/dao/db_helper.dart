// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();
  static const dbName = "database.db";

  DatabaseHelper.getInstance();
  factory DatabaseHelper() => _instance;
  Database? _db;

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = '$databasesPath/$dbName';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  void _onCreate(Database db, int newVersion) async {
    await _executeSql(db, "create");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // if (oldVersion == 1 && newVersion == 2) {
    //   await _executeSql(db, "update");
    // }
  }

  _executeSql(Database db, String sqlFile) async {
    String fileSql = "$sqlFile.sql";
    String file = await rootBundle.loadString(join('assets', fileSql));
    final batch = db.batch();
    for (String s in file.split(";")) {
      if (s.trim().isNotEmpty) {
        batch.execute(s);
      }
    }
    await batch.commit();
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
