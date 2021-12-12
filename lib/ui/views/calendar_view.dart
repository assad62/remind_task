import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/viewmodels/calendar_viewmodel.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CalendarViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) => Scaffold(
              body: Center(
                child: Text("Calendar"),
              ),
            ));
  }
}
