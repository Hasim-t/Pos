import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashConroller = Get.put(SplashController());
    splashConroller.splashNavigation();
    return Scaffold(
      backgroundColor: const Color(0XFF029BFE),
      body: FadeTransition(
        opacity: splashConroller.fadeanimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/LogoPos1.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const Text(
                    "POS Delivery App",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );   
  }
}
