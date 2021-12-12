import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/ui/views/today_view.dart';
import 'package:flutter_starter_app/utils/constants.dart';
import '../../common/base_view.dart';
import '../../viewmodels/home_viewmodel.dart';
import 'calendar_view.dart';

class HomeView extends StatefulWidget {


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static  List<Widget> _pages = <Widget>[
   TodayView(),
   CalendarView()
  ];


  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) =>
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                centerTitle: false,
                title: Text(Constants.AppName, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
              body:_pages.elementAt(_selectedIndex) ,
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.dashboard_customize,
                    ),
                    label: 'Today',
                  ),
                  BottomNavigationBarItem(

                    icon: Icon(
                      Icons.event_note,
                    ),
                    label: 'Calendar',
                  ),

                ],
              ),

            )


    );

  }
}

