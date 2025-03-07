// ignore_for_file: body_might_complete_normally_nullable, constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/BussinessLogic_layer/cubit/character_cubit.dart';
import 'package:wheather/Constant/string.dart';
import 'package:wheather/Data_Layer/Reposirey/repositry.dart';
import 'package:wheather/Data_Layer/Services/model_service.dart';
import 'package:wheather/Presentation_Layer/Views/Screens/home.dart';

class AppRouter {
  late Repositry repositry;
  late CharacterCubit charactercubit;
  AppRouter() {
    repositry = Repositry(ModelService());
    charactercubit = CharacterCubit(repositry);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigatorRouter.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharacterCubit(
              repositry,
            ),
            child: const Home(),
          ),
        );
    }
  }
}
