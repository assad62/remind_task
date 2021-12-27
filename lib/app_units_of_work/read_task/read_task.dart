import 'package:flutter_starter_app/models/task_model.dart';

abstract class IReadTaskUnit{
   Future<List<TaskModel>> getAllTasks();
   String getFormattedStartEndTime(int startTime, int endTime);
   Future<Map<String, List<TaskModel>>> getTasksForMonth(DateTime day);
}




