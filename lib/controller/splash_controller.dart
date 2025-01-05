import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/service/login_service.dart';
import 'package:posdelivery/view/screen/home_screen.dart';
import 'package:posdelivery/view/screen/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Animation<double> fadeanimation;
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fadeanimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.forward();
  }

  @override
  void onReady() {
    splashNavigation();
    super.onReady();
  }

  Future<void> splashNavigation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    final isLoggedin = pref.getBool('isLogin') ?? false;
    final apiKey = pref.getString('api_key');
    if (isLoggedin && apiKey != null && apiKey.isNotEmpty) {
      Get.off(const HomeScreen());
    } else {
      Get.off( const LoginPage());
    }
  }
}
