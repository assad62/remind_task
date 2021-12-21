import 'package:flutter_starter_app/units/map_transform/map_transform_service.dart';

class MapTransformService extends IMapTransformService{

  @override
  Map<String, dynamic> convertDateTimeToEpoch(Map<String, dynamic> map) {

    Map<String,dynamic> encodedMap ={};
    map.forEach((key, value) {

      if (value is DateTime) {
         encodedMap[key] =  value.microsecondsSinceEpoch;
      }else{
         encodedMap[key] = value;
      }

    });

    return encodedMap;
  }

}