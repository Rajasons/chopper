import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';

class CustomTextField extends StatelessWidget {

  String hinttext;
  String? title;
  bool? readonly;
  Widget? prefixIcon, suffixIcon;
  TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  GestureTapCallback? onTap;
  int? maxLines = 1,maxlength;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;

  CustomTextField({this.title,this.onChanged,this.maxlength, this.hintStyle, this.maxLines, this.onTap, this.readonly, this.controller, this.validator, this.keyboardType, required this.hinttext, this.prefixIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null ? SizedBox() : Text(title ?? "",style: Black15,),
        AddVerticalSpace(5),
        TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          readOnly: readonly ?? false,
          maxLines: maxLines ?? 1,
          maxLength: maxlength ?? null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType ?? TextInputType.text,
          style: Black12,
          //TextStyle(color: Colors.black),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            hintStyle: hintStyle ?? null,
            fillColor: AppColor.primarytextfieldbackcolor,
            prefixIcon: prefixIcon ?? null,
            prefixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused)
                ? Colors.black
                : AppColor.primaryGreyColor),
            suffixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused)
                ? Colors.black
                : AppColor.primaryGreyColor),
            suffixIcon: suffixIcon ?? null,
            hintText: hinttext,
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide:  readonly == true ? BorderSide(color: Colors.white) : BorderSide(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
