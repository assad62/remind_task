import 'dart:convert';

import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/repository/task_repository_impl.dart';
import 'package:uuid/uuid.dart';

class CreateTaskViewModel extends BaseModel{

  //util
  Map<String, dynamic>? encodeMap(Map<String, dynamic> map) {
    Map<String,dynamic> encodedMap ={};
    map.forEach((key, value) {
      if (value is DateTime) {
        encodedMap[key] = value.toString();
      }
    });
    return encodedMap;
  }


  var _uuid = Uuid();
  var _repo = TaskRepo();

  void onFirstLoad(){

  }

  Future addToTaskList(Map<String, dynamic> formMap) async {

         Map dataMap = {
           'uuid': _uuid.v4().toString(),
           'data': encodeMap(formMap),
         };

         await _repo.insertTask(dataMap);
  }
}