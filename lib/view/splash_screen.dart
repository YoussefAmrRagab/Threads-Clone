import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../view/res/strings.dart';

import '../controller/controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    Timer(const Duration(seconds: 6), () {
      Get.offNamed(StringManager.homeRoute);
    });
    return Scaffold(
      body: Center(
        child: Lottie.asset(StringManager.splashAsset),
      ),
    );
  }
}
