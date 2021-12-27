import 'package:flutter_starter_app/app_units_of_work/read_task/read_task.dart';
import 'package:flutter_starter_app/app_units_of_work/read_task/repository/read_task_repository_impl.dart';
import 'package:flutter_starter_app/models/task_model.dart';

class ReadTaskUnit implements IReadTaskUnit{

  var _repo = ReadTaskRepository();

  @override
  Future<List<TaskModel>> getAllTasks() async {
     return await _repo.getAllTasks();
  }

  @override
  String getFormattedStartEndTime(int starTime, int endTime) {
    return  _repo.getFormattedStartEndTime(starTime,endTime);
  }

  Future<List<TaskModel>?> getTasksForDay(DateTime day) {
    return _repo.getTasksForDay(day);
  }

  @override
  Future<Map<String, List<TaskModel>>> getTasksForMonth(DateTime day) {
     return _repo.getTasksForMonth(day);
  }

}