import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/view_model/LoginController/login_controller.dart';
import 'package:taxiuser/view_model/RagistartionController/ragistration_controller.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import 'package:taxiuser/view_model/SplashController/splash_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {


  @override
  Widget build(BuildContext context) {

    SplashController splashController = Get.put(SplashController());
    AuthController authController = AuthController.instant;
    RagistrationController ragistrationController = Get.put(RagistrationController());
    LoginController loginController = Get.put(LoginController());

    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Container(
              height: 250.h,
              child: Image.asset(
                "assets/images/login_ragistration_image.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  authController.screen[authController.authscreenindex.value],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
