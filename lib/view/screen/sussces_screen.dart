import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/model/order_list_model.dart';
import 'package:posdelivery/view/screen/home_screen.dart';

class SusscesScreen extends StatelessWidget {
  const SusscesScreen({super.key, required this.studentData});
 final Datum studentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE7E9FD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0088FF),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Thank You',
              style: TextStyle(color: Colors.blue, fontSize: 32),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Delivery Confirmed! Your effort ensures our ',
              style: TextStyle(color: Color(0XFF1E3D6C)),
            ),
            const Text(
              'students receive their items on time. ',
              style: TextStyle(color: Color(0XFF1E3D6C)),
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              '#${studentData.id} | ${studentData.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Text(
              '${studentData.items[0].createdAt}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.off( const HomeScreen());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                        size: 32,
                      ),
                      Text(
                        'Back to Home ',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
