import 'package:flutter/material.dart';

class CustomTextwidget extends StatelessWidget {
  final String text;

  final double? size;
  final Color? color;
  final FontStyle? fontStyle;

  const CustomTextwidget({super.key, this.color, required this.text, this.size, this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: color??Colors.white,
      fontSize: size??23.0,
     
    ),);
  }
}
