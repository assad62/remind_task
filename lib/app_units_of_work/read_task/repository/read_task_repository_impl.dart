import 'package:flutter_starter_app/app_units_of_work/read_task/repository/read_task_repository.dart';
import 'package:flutter_starter_app/app_units_of_work/read_task/service/read_task_service_impl.dart';
import 'package:flutter_starter_app/models/task_model.dart';

class ReadTaskRepository implements IReadTaskRepository{

  var _service = ReadTaskService();

  @override
  Future<List<TaskModel>> getAllTasks() async{

    return await _service.getAllTasks();
  }

  String getFormattedStartEndTime(int starTime, int endTime) {
    return _service.getFormattedStartEndTime(starTime,endTime);
  }

}