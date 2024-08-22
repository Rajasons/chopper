// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:page_flip/page_flip.dart';
// import 'package:taxiuser/screen/IntroScreen/NewIntroScreen/component/intro_one_screen.dart';
// import 'package:taxiuser/screen/IntroScreen/NewIntroScreen/component/intro_second_screen.dart';
// import 'package:taxiuser/screen/IntroScreen/NewIntroScreen/component/intro_third_screen.dart';
//
// class NewIntroscreen extends StatefulWidget {
//   @override
//   State<NewIntroscreen> createState() => _NewIntroscreenState();
// }
//
// class _NewIntroscreenState extends State<NewIntroscreen> {
//
//   List<Widget> Intro = [
//     IntroOneScreen(),
//     IntroSecondScreen(),
//     IntroThirdScreen()
//   ];
//
//   final _controller = GlobalKey<PageFlipWidgetState>();
//
//   int introindex = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // return Scaffold(
//     //   body: Column(
//     //     children: [
//     //       PageView(
//     //         controller: pageController,
//     //         onPageChanged: (value) {
//     //           pageController.animateToPage(value,
//     //               duration: Duration(milliseconds: 100), curve: Curves.easeIn);
//     //         },
//     //         children: [
//     //           IntroOneScreen(),
//     //           IntroSecondScreen(),
//     //           IntroThirdScreen(),
//     //         ],
//     //         physics: BouncingScrollPhysics(),
//     //       ),
//     //
//     //     ],
//     //   ),
//     // );
//
//     return Scaffold(
//       body: PageFlipWidget(
//         key: _controller,
//         backgroundColor: Colors.white,
//         duration:Duration(milliseconds: 500),
//         // isRightSwipe: true,
//         // lastPage: Container(
//         //   color: Colors.white,
//         //   child:  Center(
//         //     child: Text('Last Page!'),
//         //   ),
//         // ),
//         children: Intro
//       ),
//       floatingActionButton: ElevatedButton(onPressed: () async {
//
//         if (introindex < Intro.length - 1) {
//           await _controller.currentState?.nextPage();
//           setState(() {
//
//           });
//         } else {
//           print("Reached the last page");
//         }
//
//       }, child: Text("skip".tr)),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/view_model/IntroController/intro_controller.dart';

import '../../../constant/image.dart';
import 'component/intro_one_screen.dart';
import 'component/intro_second_screen.dart';
import 'component/intro_third_screen.dart';

class NewIntroScreen extends StatefulWidget {
  @override
  _NewIntroScreenState createState() => _NewIntroScreenState();
}

class _NewIntroScreenState extends State<NewIntroScreen> {

  IntroController introController = Get.put(IntroController());
  final SwiperController _controller = SwiperController();

  void _flipToNextPage() {
    if (introController.introPageIndex.value) {
      Get.offAllNamed(RouteName.continuewithmobile_screen);
    } else {
      _controller.next();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Swiper(
              autoplay: false,
              loop: false,
              onIndexChanged: (value) {
                if (value == 2) {
                  introController.introPageIndex.value = true;
                } else {
                  introController.introPageIndex.value = false;
                }
              },
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                List<Widget> introPages = [
                  IntroOneScreen(),
                  IntroSecondScreen(),
                  IntroThirdScreen(),
                ];
                return introPages[index];
              },
              itemCount: 3,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: AppColor.primaryryellowcolor),
              ),
              control: SwiperControl(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
              ),
              curve: Curves.easeInCirc,
              duration: 800,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(RouteName.continuewithmobile_screen);
                  },
                  child: Text(
                    "skip".tr,
                    style: Black15,
                  ),
                ),
                GestureDetector(
                  onTap: _flipToNextPage,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        AppImage.Skip,
                        scale: 0.90,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
