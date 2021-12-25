import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/viewmodels/today_viewmodel.dart';

class TodayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TodayViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) => Scaffold(
          body:ListView.builder(
            itemCount: model.tasksList.length,
            itemBuilder: (context, i){

                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 80,
                        color: Color(model.tasksList[i].data?.colorPicker ?? 0),),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${model.tasksList[i].data?.title ?? ""}",style: TextStyle(fontSize: 18),),
                          Text("${model.tasksList[i].data?.description ?? ""}",style: TextStyle(fontSize: 14)),
                        ],
                      ),

                    ],
                  )


                );

            },
          ),
          floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: model.addNewTask,
          child: Icon(Icons.add),
         ),
        ));
  }
}