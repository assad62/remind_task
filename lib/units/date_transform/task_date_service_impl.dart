import 'package:flutter_starter_app/units/date_transform/task_date_service.dart';
import 'package:intl/intl.dart';

class TaskDateService implements ITaskDateService{
  @override
  int changeDateToMillisecEpoch(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  @override
  String formatDateTimeToString(int dateMillisecondsEpoch) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(dateMillisecondsEpoch);
    return date.toString();
  }

  @override
  String formatDateNowToYearAsString() {

    return DateFormat.yMMMd().format(DateTime.now());
  }

  @override
  DateTime changeMiliSecEpochToDateTime(int dateMiliSecEpoch) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(dateMiliSecEpoch);
    return date;
  }
  
}