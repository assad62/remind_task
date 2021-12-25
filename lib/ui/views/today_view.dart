import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/models/task_model.dart';
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
                          Text("${model.tasksList[i].data?.title ?? ""}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("${model.tasksList[i].data?.description ?? ""}",style: TextStyle(fontSize: 14)),
                          SizedBox(height: 20,),
                          Text(model.getTime(model.tasksList[i]),style: TextStyle(fontSize: 12)),
                          SizedBox(height: 5,),
                        ],
                      ),
                      Spacer(),
                      Visibility(
                        visible: model.tasksList[i].data?.attachmentPhoto !=null ,
                          child: Container(
                              height: 80,
                              width: 80,
                              child: Image.file(
                                  File(model.tasksList[i].data?.attachmentPhoto ?? ""),
                                fit: BoxFit.cover,
                              ))
                      )

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