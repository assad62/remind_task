import 'package:flutter_starter_app/models/task_model.dart';

abstract class IReadTaskService{
  Future<List<TaskModel>> getAllTasks();
}