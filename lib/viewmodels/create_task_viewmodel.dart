import 'package:flutter_starter_app/app_units_of_work/create_task/create_task_impl.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/units/date_transform/task_date_service_impl.dart';
import 'package:flutter_starter_app/units/map_transform/map_transform_service_impl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class CreateTaskViewModel extends BaseModel{

  late var _passedDate ;
  var _date = '';
  var _uuid = Uuid();
  var _createTaskUnit = CreateTaskUnit();
  var _mapTransformService  = MapTransformService();

  void onFirstLoad() async{

  }

  Future<void> addToTaskList(Map<String, dynamic> formMap) async {


        Map<String,dynamic> taskMap = {
           'uuid': _uuid.v4().toString(),
           'date': _date,
           'data': _mapTransformService.convertMapForStorage(formMap),
         };


        await _createTaskUnit.addTaskToDatabase(taskMap);
  }

  String getTaskDate() {

    if(_passedDate !=null){
      _date = TaskDateService().formatDateToYearAsString(_passedDate);

      return _date;
    }

      _date = TaskDateService().formatDateNowToYearAsString();
      return _date;




  }

  void initPassedData(DateTime selectedDate) {
      _passedDate = selectedDate;
  }
}