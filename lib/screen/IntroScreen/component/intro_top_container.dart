import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:taxiuser/view_model/IntroController/intro_controller.dart';

class IntroTopContainer extends StatelessWidget {
  final controller = IntroController.instant;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: Obx(
          () => Container(
              width: double.infinity,
              child: controller.intropageindex == 0
                  ? Lottie.asset("assets/lottie/intro_lottie_1.json",
                      fit: BoxFit.cover)
                  : controller.intropageindex == 1
                      ? Lottie.asset("assets/lottie/intro_lottie_2.json",
                          fit: BoxFit.cover)
                      : Lottie.asset("assets/lottie/intro_lottie_3.json",
                          fit: BoxFit.cover)),
        ));
  }
}
