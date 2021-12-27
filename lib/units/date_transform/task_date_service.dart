abstract class ITaskDateService{
  int changeDateToMillisecEpoch(DateTime date);
  DateTime changeMiliSecEpochToDateTime(int date);
  String formatDateTimeToString(int date);
  String formatDateNowToYearAsString();
  String formatDateToYearAsString(DateTime date);
}