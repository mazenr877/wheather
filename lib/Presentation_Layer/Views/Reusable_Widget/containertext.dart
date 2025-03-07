// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  String name;
  EdgeInsetsGeometry padding;
  AlignmentGeometry alignment;
  double fontsize;
  FontWeight fontweight;
  Color color;
  ContainerText({
    super.key,
    required this.name,
    required this.padding,
    required this.alignment,
    required this.fontweight,
    required this.color,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        alignment: alignment,
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          name,
          style: TextStyle(
            

            fontSize: fontsize,
            fontWeight: fontweight,
            color: color,
          ),
        ));
  }
}
