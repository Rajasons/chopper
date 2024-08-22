import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/ProfileController/profile_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_text_field.dart';
import '../../constant/color.dart';
import '../../constant/textstyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  ProfileController profileController = Get.put(ProfileController());
  ImagePicker picker = ImagePicker();

  List<String> gender = [
    "male",
    "female",
    "other",
  ];

  @override
  void initState() {
    profileController.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: customAppbar(
            iconcolor: Colors.black,
            textcolor: Colors.black,
            text: "user_profile_home".tr,
            backcolor: Colors.white.withOpacity(0.0)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddVerticalSpace(40),
                Stack(children: [
                  ClipOval(
                    clipBehavior:Clip.antiAlias ,
                    child: CircleAvatar(
                      radius: 60.sp,
                      child: profileController.userProfileUrl.value == null
                          ? CircularProgressIndicator()
                          : Image.file(
                              profileController.userProfileUrl.value!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 8.h,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                            onTap: () async {
                                              XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
                                                profileController.userProfileUrl.value = File(imageFile!.path);
                                                Get.back();
                                            },
                                            child: Icon(
                                              Icons.camera_alt,
                                              size: 35.h,
                                              color: AppColor.primaryGreyColor,
                                            )),
                                        AddVerticalSpace(10),
                                        Text(
                                          "Camera",
                                          style: Black15,
                                        ),
                                      ],
                                    ),
                                    AddHorizontalSpace(10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
                                            profileController.userProfileUrl.value = File(imageFile!.path);
                                            Get.back();
                                          },
                                          child: Icon(
                                            Icons.photo,
                                            size: 35.h,
                                            color: AppColor.primaryGreyColor,
                                          ),
                                        ),
                                        AddVerticalSpace(10.h),
                                        Text(
                                          "Gallery",
                                          style: Black15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        AppImage.editimage,
                        height: 25.h,
                      ),
                    ),
                  )
                ]),
                AddVerticalSpace(40),
                CustomTextField(
                    readonly: profileController.isProfileEdit.value,
                    controller: profileController.userNameController,
                    hinttext: "user_name_hinttext".tr,
                    prefixIcon: Icon(Icons.person)),
                AddVerticalSpace(20),
                CustomTextField(
                    readonly: profileController.isProfileEdit.value,
                    controller: profileController.useremailController,
                    hinttext: "email_hinttext".tr,
                    prefixIcon: Icon(Icons.email)),
                AddVerticalSpace(20),
                CustomTextField(
                  keyboardType: TextInputType.phone,
                  readonly: true,
                  controller: profileController.userMobileController,
                  hinttext: "mobile_hinttext".tr,
                  prefixIcon: Icon(Icons.phone),
                ),
                AddVerticalSpace(20),
                AbsorbPointer(
                  absorbing: profileController.isProfileEdit.value,
                  child: DropdownButtonFormField(
                    icon: Icon(Icons.arrow_downward_outlined),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.primarytextfieldbackcolor,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryGreyColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    value: profileController.gender.value,
                    hint: Text(
                      "any_queries".tr,
                      style: Black15,
                    ),
                    items: gender.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: Black15,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      profileController.gender.value = value!;
                    },
                  ),
                ),
                AddVerticalSpace(50),
                CustomButton(
                  isload: profileController.isload.value,
                  btnText: profileController.isProfileEdit.value
                      ? "edit_profile".tr
                      : "save_profile".tr,
                  onPressed: () {
                    if (profileController.isProfileEdit.value) {
                      profileController.isProfileEdit.value = false;
                    } else {
                      profileController.updateProfileData(context);
                      profileController.isProfileEdit.value = true;
                    }
                  },
                ),
                AddVerticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
