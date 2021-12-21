import 'package:flutter_starter_app/units/task_date/task_date_service.dart';


class TaskDateService implements ITaskDateService{
  @override
  int changeDateToMillisecEpoch(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  @override
  DateTime changeDateToString(int dateMillisecondsEpoch) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(dateMillisecondsEpoch);
    return date;
  }
  
}