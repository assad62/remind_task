import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/viewmodels/calendar_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {

  var _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BaseView<CalendarViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) => Scaffold(
              body: TableCalendar(
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  //return isSameDay(_selectedDay, day);
                  return true;
                },
                onDaySelected: (selectedDay, focusedDay) {
                  print("selectedDate is $selectedDay");
                  print("ficysedDate is $focusedDay");

                },
                eventLoader: (day) {
                  return [Event(title:"hello",desc:"how are you"),Event(title:"hello",desc:"how are you")];
                },
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: (context,date,list){
                    return Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                    );
                  },

                ),
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 1, 1),
                focusedDay: _focusedDay,
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              )
            ));
  }
}

class Event {
  String desc;
  String title;


  Event({required this.title, required this.desc});
}
