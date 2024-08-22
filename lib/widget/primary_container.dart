import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryContainer extends StatelessWidget {

  Color? backcolor;
  double? topleft, topright, bottomleft, bottomright;
  final Widget? child;
  double? height, width;
  int? flex;

  PrimaryContainer(
      {this.backcolor,
      this.height,
      this.width,
      this.topleft,
      this.topright,
      this.bottomleft,
      this.bottomright,
      this.child,
      this.flex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h,
      width: width?.w,
      decoration: BoxDecoration(
        color: backcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topleft?.sp??0),
          topRight: Radius.circular(topright?.sp??0),
          bottomLeft: Radius.circular(bottomleft?.sp??0),
          bottomRight: Radius.circular(bottomright?.sp??0),
        ),
      ),
      child: child ?? null,
    );
  }
}
