import 'package:flutter_starter_app/models/task_model.dart';

abstract class IReadTaskService{
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>?> getTasksForDay(DateTime day);

  Future<Map<String, List<TaskModel>>> getTasksForMonth(DateTime day);

}
