import 'package:flutter_starter_app/units/date_transform/task_date_service.dart';
import 'package:intl/intl.dart';

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

  @override
  String formatDateNowToYear() {

    return DateFormat.yMMMd().format(DateTime.now());
  }
  
}