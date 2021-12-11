import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:sembast/sembast.dart';

import '../common/base_model.dart';
import '../common/viewstate.dart';
import 'package:rxdart/rxdart.dart';
class HomeModel extends BaseModel{
  int counter = 0;
  int initialRxCount = 0;
  late BehaviorSubject<int> rxCounter;
  void onFirstLoad(){

    rxCounter = new BehaviorSubject<int>.seeded(this.initialRxCount); //
  }

  void incrementCounter() async{
     counter++;

     // dynamically typed store
     var store = StoreRef.main();
// Easy to put/get simple values or map
// A key can be of type int or String and the value can be anything as long as it can
// be properly JSON encoded/decoded
    await store.record('title').put(await AppDatabaseService().getAppDataBase(), 'Simple application');
    await store.record('version').put(await AppDatabaseService().getAppDataBase(), 10);
    await store.record('settings').put(await AppDatabaseService().getAppDataBase(), {'offline': true});

// read values
    var title = await store.record('title').get(await AppDatabaseService().getAppDataBase()) as String;
    var version = await store.record('version').get(await AppDatabaseService().getAppDataBase()) as int;
    var settings = await store.record('settings').get(await AppDatabaseService().getAppDataBase()) as Map;


    print("title is $title");
    print("version is $version");
    print("settings is $settings");
     setState(ViewState.Idle);
  }

  @override
  void dispose(){
    rxCounter.close();
  }

  void updateRxCounter() {
    initialRxCount ++;
    rxCounter.sink.add(initialRxCount);



  }


}