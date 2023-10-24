import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/routs/dashboard/dash_board.dart';
import 'package:rainbow/routs/splash/splash_screen.dart';
import 'package:rainbow/utils/image_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

