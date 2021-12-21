import 'package:flutter_starter_app/models/task_model.dart';

abstract class IReadTaskRepository{
  Future<List<TaskModel>> getAllTasks();
}
