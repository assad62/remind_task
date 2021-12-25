import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/units/create_task/create_task_impl.dart';
import 'package:flutter_starter_app/units/map_transform/map_transform_service_impl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class CreateTaskViewModel extends BaseModel{



  var _uuid = Uuid();
  var _createTaskUnit = CreateTaskUnit();
  var _mapTransformService  = MapTransformService();

  void onFirstLoad() async{

  }

  Future<void> addToTaskList(Map<String, dynamic> formMap) async {



         //formMap["attachmentPhoto"] = filePath;
         Map<String,dynamic> taskMap = {
           'uuid': _uuid.v4().toString(),
           'data': _mapTransformService.convertMapForStorage(formMap),
         };

         print("formMap is $formMap");
         print("taskMap is $taskMap");
         await  _createTaskUnit.addTaskToDatabase(taskMap);
  }
}