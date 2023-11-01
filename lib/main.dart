import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './view/comment_screen.dart';
import './util/binding.dart';
import './view/home_screen.dart';
import './view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/comment', page: () => CommentScreen()),
      ],
    );
  }
}
