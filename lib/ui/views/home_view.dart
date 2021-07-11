import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notlar_flutter/common/base_view.dart';
import 'package:notlar_flutter/viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) =>
            Scaffold(
              appBar: AppBar(

                title: Text("My Home Page"),
              ),
              body: Center(

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${model.counter}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: model.incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            )


    );

  }
}

