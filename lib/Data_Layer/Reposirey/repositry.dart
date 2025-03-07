// ignore_for_file: unused_import

import 'package:wheather/Data_Layer/Model/current_model.dart';
import 'package:wheather/Data_Layer/Services/model_service.dart';

class Repositry {
  ModelService modelservice;
  Repositry(this.modelservice);
  Future<CurrentModel> getallapi(String city) async {
    final characters = await modelservice.getapi(city);
    return characters;
  }
}
