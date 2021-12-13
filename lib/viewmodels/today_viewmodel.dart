import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/ui/router.dart';

import '../locator.dart';

class TodayViewModel extends BaseModel{
  var _context = locator<NavigationService>().navigatorKey.currentContext!;

  void addNewTask(){

    Navigator.pushNamed(_context, AppRoutes.createTaskPageRoute);
  }

  void onFirstLoad(){

  }
}