import 'dart:convert';

import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/units/read/read_task_impl.dart';
import 'package:sembast/sembast.dart';

class CalendarViewModel extends BaseModel{
  var _readTaskUnit = ReadTaskUnit();


  void onFirstLoad() async{
     //print("aa ${await _readTaskUnit.getAllTasks()}");
  }
}