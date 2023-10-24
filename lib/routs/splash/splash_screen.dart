import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/routs/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StoreController storeController = StoreController();
    storeController.getResources();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* kDebugMode ? Image.asset("images/logo.png",height: 50,width: 50,)
           :*/
            Image.asset(
              "assets/images/logo.png",
              height: MediaQuery.of(context).size.height * 0.45,
            ),
          ],
        ),
      ),
    );
  }
}
