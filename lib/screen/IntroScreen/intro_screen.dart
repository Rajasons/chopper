import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/screen/IntroScreen/component/intro_bottom_container.dart';
import 'package:taxiuser/screen/IntroScreen/component/intro_top_container.dart';
import 'package:taxiuser/view_model/IntroController/intro_controller.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

   IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            IntroTopContainer(),
            IntroBottomContainer(),
        ],
      ),
    );
  }
}
