import 'package:flutter/material.dart';
import 'package:flutter_starter_app/units/date_transform/task_date_service_impl.dart';
import 'package:flutter_starter_app/units/map_transform/map_transform_service.dart';



class MapTransformService extends IMapTransformService{

  var _dateTaskService = TaskDateService();

  @override
  Map<String, dynamic> convertMapForStorage(Map<String, dynamic> map) {

    Map<String,dynamic> encodedMap ={};

    map.forEach((key, value) {


      switch (value.runtimeType){
        case DateTime:
          encodedMap[key] =  _dateTaskService.changeDateToMillisecEpoch(value);
          break;
        case MaterialColor:
           MaterialColor color = value;
           encodedMap[key] = color.value;

           break;
        case List:
          //image
          encodedMap[key] = value[0].path;
          break;
        default:
          encodedMap[key] = value;
          break;

      }



    });

    return encodedMap;
  }

}