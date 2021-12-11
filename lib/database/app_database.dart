import 'package:flutter_starter_app/database/app_doc_dir_service.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._internal();



  AppDatabase._internal();

  factory AppDatabase() {
    return _singleton;
  }

  static Future<Database> create() async {
    String dbPath = "${await AppDocDirService().getAppDocDirectory()}/remintask.db" ;
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbPath);
    return db;
  }

}