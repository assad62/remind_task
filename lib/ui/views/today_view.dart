import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/viewmodels/today_viewmodel.dart';

class TodayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TodayViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) => Scaffold(
          body: Center(
            child: Text("Today"),
          ),
        ));
  }
}