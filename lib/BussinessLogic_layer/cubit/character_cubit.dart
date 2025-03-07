// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wheather/Data_Layer/Model/current_model.dart';
import 'package:wheather/Data_Layer/Reposirey/repositry.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  TextEditingController controllers = TextEditingController();
  late Repositry repositry;
  late var city = "";
  change_city() {
    city = controllers.text;
    emit(CharacterSuccessful());
  }

  CharacterCubit(
    this.repositry,
  ) : super(CharacterInitial());
  // API
  // List<Model> characters = [];
  // List<Model> getapi() {
  //   try{
  //     emit(CharacterLodding());
  //      repositry.getallapi().then((characters) {
  //        emit(CharacterSuccessful());
  //       this.characters = characters;
  //     });
  //   }
  //   catch(error){
  //     emit(CharacterError(erroMessage: error.toString()));
  //   }
  //    return characters;
  //  }
  //
  CurrentModel? currentmodel;
  void getapi() async {
    var product = await repositry.getallapi(city);

    try {
      emit(CharacterLodding());
      currentmodel = product;
      emit(CharacterSuccessful());
    } catch (error) {
      emit(CharacterError(erroMessage: error.toString()));
    }
  }
}
