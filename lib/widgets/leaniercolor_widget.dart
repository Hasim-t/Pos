import 'package:flutter/material.dart';

class LeaniercolorWidget extends StatelessWidget {
  final Widget child;

  const LeaniercolorWidget({super.key, required this.child});

   @override
  Widget build(BuildContext context) {

      return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF00EDFF),
            Color(0XFF029BFE)
          ]
        )
      ),
      child:child,
    );
  }
}
