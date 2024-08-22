import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import '../constant/color.dart';

double defaultHorizontalPadding = 40.0.w;
double defaultVerticalPadding = 30.0.w;

final authController = AuthController.instant;

RegExp regexEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

RegExp regexPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

RegExp regexMobile = RegExp(r'^(\+?\d{1,4}[\s-]?)?\d{10}$');

void ErrorToast({required String Title,
  required String Message,
    required BuildContext context}) {
  return MotionToast.error(
          width: double.infinity,
          enableAnimation: true,
          position: MotionToastPosition.bottom,
          animationType: AnimationType.fromLeft,
          title: Text(Title),
          description: Text(Message))
      .show(context);
}

void WarningToast(
    {required String Title,
    required String Message,
    required BuildContext context}) {
  return MotionToast.warning(
          width: double.infinity,
          enableAnimation: true,
          position: MotionToastPosition.bottom,
          animationType: AnimationType.fromLeft,
          title: Text(Title),
          description: Text(Message))
      .show(context);
}

void SuccessToast(
    {required String Title,
    required String Message,
    required BuildContext context}) {
  return MotionToast.success(
          width: double.infinity,
          enableAnimation: true,
          position: MotionToastPosition.bottom,
          animationType: AnimationType.fromLeft,
          title: Text(Title),
          description: Text(Message))
      .show(context);
}

Widget AddVerticalSpace(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget AddHorizontalSpace(double width) {
  return SizedBox(
    width: width.w,
  );
}

PreferredSizeWidget customAppbar(
    {required String text,
    List<Widget>? action,
    Widget? iconButton,
    Color? iconcolor,
    Color? textcolor,
    Color? backcolor}) {
  return AppBar(
    iconTheme: IconThemeData(color: iconcolor ?? Colors.white),
    backgroundColor: backcolor ?? AppColor.primaryBlueColor,
    elevation: 0.0,
    actions: action ?? null,
    leading: iconButton ?? null,
    title: Text(
      text,
      style: TextStyle(color: textcolor ?? Colors.white),
    ),
    centerTitle: true,
  );
}

onwillPopScopeAuthScreen(int authscreenindex) async {
  return authController.authscreenindex.value = authscreenindex;
}
