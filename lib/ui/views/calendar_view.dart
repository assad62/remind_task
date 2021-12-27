import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/viewmodels/calendar_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime? _selectedDay;


  var _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {


    return BaseView<CalendarViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) =>
            Scaffold(
                body: Column(
                children: [
                 TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonShowsNext: true,
                    formatButtonVisible: false,
                    titleCentered: true,
                    headerPadding: EdgeInsets.only(bottom: 16),
                    headerMargin: EdgeInsets.zero,
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {


                    if (!isSameDay(_selectedDay, selectedDay)) {

                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });


                    }

                  },
                  eventLoader: (day)  {
                    return model.getEventsForDay(day);

                    //return [Event(title:"hello",desc:"how are you"),Event(title:"hello",desc:"how are you")];
                  },
                   calendarBuilders: CalendarBuilders(
                    singleMarkerBuilder: (context, date, list) {

                      var task = list as TaskModel;
                      return model.getMarkers(date,task);


                    },
                  ),
                  firstDay: DateTime.now().subtract(Duration(days: 7)),
                  lastDay: DateTime.utc(2030, 1, 1),
                  focusedDay: _focusedDay,
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },

                ),
                  Expanded(
                    child: FutureBuilder<List<TaskModel>?>(
                        future: model.getEventsFoSelectedDay(_focusedDay!),
                        builder:(context, AsyncSnapshot<List<TaskModel>?> snapshot) {
                           if(snapshot.data?.length == 0) {
                             return Container(
                                 height: double.maxFinite,


                                 child: Center(child: Text("No Events",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
                             );
                           }

                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length == null ? 0 : snapshot.data?.length,

                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    elevation: 0,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 6.0,
                                      ),
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        children: [

                                          Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 6,
                                                color: Color(snapshot.data?[index].data?.colorPicker ?? 0),
                                              ),
                                              SizedBox(width: 10,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('${ snapshot.data?[index].data?.title}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                  Text('${ snapshot.data?[index].data?.description}', style: TextStyle(fontSize: 16)),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Text( DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data?[index].data?.startTime ?? 0)).toString()+ ' - ', style: TextStyle(fontSize: 14),),
                                                      Text( DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data?[index].data?.endTime ?? 0)).toString(), style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),



                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );

                        }
                    ),
                  )

              ],
            ),
                floatingActionButton:  FloatingActionButton(
              backgroundColor: Colors.black,
               onPressed: (){
                 model.addNewTask(_focusedDay);
               },

              child: Icon(Icons.add),
            ),
            )
    );
  }
}
