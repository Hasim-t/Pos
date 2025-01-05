import 'package:flutter/material.dart';
import 'package:posdelivery/model/order_list_model.dart';
import 'package:posdelivery/service/login_service.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SliderWidget extends StatelessWidget {
  final Datum studentData;

  const SliderWidget({super.key, required this.studentData});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SlideAction(
        borderRadius: 10,
        innerColor: Colors.white,
        outerColor: Color(0XFF029CFE),
        sliderButtonIconPadding: 12,
        text: 'Swipe to Complete the order',
        textStyle: TextStyle(fontSize: 18),
        onSubmit: () {
           submitOrder(
            studentData,
              studentData.orderId.toString(),
              studentData.status,
              studentData.items[0].itemId.toString(),
              studentData.itemCount.toString());
        },
        sliderButtonIcon: Container(
          width: 32,
          child: Row(
            children: [
              SizedBox(
                  width: 8,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    weight: 12,
                    color: Color.fromARGB(140, 53, 81, 239),
                  )),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(0XFF3150F5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
