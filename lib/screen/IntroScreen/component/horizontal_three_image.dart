import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/view_model/IntroController/intro_controller.dart';
import '../../../utils/constant.dart';

class HorizontalThreeImage extends StatelessWidget {

  final controller = IntroController.instant;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => controller.intropageindex == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.Horizontalrect),
                    AddHorizontalSpace(5),
                    Image.asset(AppImage.Verticalerect),
                    AddHorizontalSpace(5),
                    Image.asset(AppImage.Verticalerect),
                  ],
                )
              : controller.intropageindex == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.Verticalerect),
                        AddHorizontalSpace(5),
                        Image.asset(AppImage.Horizontalrect),
                        AddHorizontalSpace(5),
                        Image.asset(AppImage.Verticalerect),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.Verticalerect),
                        AddHorizontalSpace(5),
                        Image.asset(AppImage.Verticalerect),
                        AddHorizontalSpace(5),
                        Image.asset(AppImage.Horizontalrect),
                      ],
                    ),
        ),
      ],
    );
  }
}
