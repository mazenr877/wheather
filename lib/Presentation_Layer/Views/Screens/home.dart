// ignore_for_file: unused_local_variable, must_be_immutable, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/BussinessLogic_layer/cubit/character_cubit.dart';
import 'package:wheather/Presentation_Layer/Views/Reusable_Widget/containertext.dart';
import 'package:wheather/Presentation_Layer/Views/Reusable_Widget/textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<CharacterCubit>(context).getapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final instance = BlocProvider.of<CharacterCubit>(context);
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (BuildContext context, CharacterState state) {
      if (state is CharacterSuccessful) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.blue[400],
          appBar: AppBar(
            backgroundColor: Colors.blue[400],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 130, horizontal: 20),
                child: Column(children: [
                  Container(
                    child: TextForm(
                      controller: instance.controllers,
                      prefix: Container(
                          width: 78,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red)),
                              onPressed: () {
                                instance.change_city();
                                print(instance.controllers.text);
                              },
                              child: const Text(
                                "search",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ))),
                      hint: "",
                      kybord: TextInputType.name,
                      obscureText: false,
                      onSav: (value) {
                        //  instance.city = value;
                      },
                      validat: (v) {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ContainerText(
                    alignment: Alignment.center,
                    color: Colors.white,
                    fontsize: 13,
                    fontweight: FontWeight.normal,
                    name: instance.city,
                    // instance.city}
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 50,
                      child: Image.network(
                          "https://th.bing.com/th/id/OIP.wl-2TDOvTBnfJ7duJ_9X-wHaE8?rs=1&pid=ImgDetMain")),
                  const SizedBox(
                    height: 25,
                  ),
                  ContainerText(
                    alignment: Alignment.center,
                    color: Colors.white,
                    fontsize: 13,
                    fontweight: FontWeight.normal,
                    name: "",
                    padding: EdgeInsets.zero,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ContainerText(
                              alignment: Alignment.center,
                              color: Colors.white,
                              fontsize: 13,
                              fontweight: FontWeight.normal,
                              name: "late",
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(width: 5),
                            ContainerText(
                              alignment: Alignment.center,
                              color: Colors.white,
                              fontsize: 13,
                              fontweight: FontWeight.normal,
                              name: "${instance.currentmodel!.city.coord.lat}",
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            ContainerText(
                              alignment: Alignment.center,
                              color: Colors.white,
                              fontsize: 13,
                              fontweight: FontWeight.normal,
                              name: "long",
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ContainerText(
                              alignment: Alignment.center,
                              color: Colors.white,
                              fontsize: 13,
                              fontweight: FontWeight.normal,
                              name: "${instance.currentmodel!.city.coord.lon}",
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  SizedBox(
                      height: 100,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: Image.network(
                                            "https://th.bing.com/th/id/OIP.wl-2TDOvTBnfJ7duJ_9X-wHaE8?rs=1&pid=ImgDetMain")),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ContainerText(
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      fontsize: 10,
                                      fontweight: FontWeight.normal,
                                      name: instance
                                          .currentmodel!.list[index].dtTxt.day
                                          .toString(),
                                      padding: EdgeInsets.zero,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ContainerText(
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      fontsize: 10,
                                      fontweight: FontWeight.normal,
                                      name: (instance.currentmodel!.list[index]
                                                  .main.temp -
                                              273)
                                          .toStringAsFixed(2),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                          itemCount: 15))
                ])),
          ),
        ));
      } else if (state is CharacterError) {
        return Text(state.erroMessage);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      //
    });
  }
}
