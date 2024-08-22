import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_text_field.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(
        text: "sos_drawer".tr,
        textcolor: Colors.black,
        iconcolor: Colors.black,
        backcolor: Colors.white.withOpacity(0.0),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpace(20),
            Text(
              "Notify and call emergency contacts".tr,
              style: Black18w500,
            ),
            AddVerticalSpace(20),
            Expanded(
              child: FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if(snapshot.hasData)
                    {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20.sp,
                              ),
                              title: Text("Name"),
                              subtitle: Text("8469965726"),
                              trailing: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.phone)),
                            ),
                          );
                        },
                      );
                    }
                  else
                    {
                       return Center(child: Image.asset(AppImage.sosnodataimage),);
                    }

                },
              ),
            ),
            Center(
              child: CustomButton(
                btnText: "add_a_contact".tr,
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("add_new_contact".tr,style: Black20,),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(hinttext: "enter_name".tr),
                          AddVerticalSpace(10),
                          CustomTextField(hinttext: "mobile_hinttext".tr,keyboardType: TextInputType.phone,),
                        ],
                      ),
                      actions: [
                        CustomButton(btnText: "save".tr, onPressed:() {
                              Get.back();
                        },),
                        AddVerticalSpace(10),
                        CustomButton(btnText: "cancel".tr, onPressed:() {
                            Get.back();
                        },),
                      ],
                    );
                  },);

                },
              ),
            ),
            AddVerticalSpace(10),
          ],
        ),
      ),
    );
  }
}
