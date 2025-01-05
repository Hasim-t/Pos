import 'package:flutter/material.dart';
import 'package:posdelivery/widgets/custom_textwidget.dart';

class Customtopbutton extends StatelessWidget {
  const Customtopbutton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        const Spacer(),
        Container(
          height: 35,
          width: 160,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: CustomTextwidget(
            text: 'Ready for Delivery',
            size: 14,
          )),
        ),
        const Spacer(),
        Container(
          height: 35,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: CustomTextwidget(
            text: 'Delivered',
            size: 15,
            color: Colors.black,
          )),
        ),
        const Spacer(),
        Container(
          height: 35,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: CustomTextwidget(
            text: 'All',
            size: 15,
            color: Colors.black,
          )),
        ),
        const Spacer()
      ],
    );
  }
}
