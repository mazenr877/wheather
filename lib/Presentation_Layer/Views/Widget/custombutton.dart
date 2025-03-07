// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double fontsize;

  final Color colors;
  final Function() onpress;
  const CustomButton({
    super.key,
    required this.name,
    required this.fontsize,
    required this.colors,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colors,
            padding: const EdgeInsets.symmetric(horizontal: 95),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: onpress,
        child: Text(
          name,
          style: const TextStyle(fontSize: 13, color: Colors.white),
        ));
  }
}
