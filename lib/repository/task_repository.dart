import 'package:flutter_starter_app/models/task_model.dart';

abstract class ITaskRepository{
   List<TaskModel> getListOfTasks();
   Future<void> insertTask(Map taskFormData);
   Future<void> deleteTask(String taskId);
   void updateTask(TaskModel newTask);
   Future<TaskModel> getAllTasks();

}