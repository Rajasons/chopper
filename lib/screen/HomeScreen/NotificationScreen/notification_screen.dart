import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map> list = [
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
    {"title": "System", "des": "Thank you! Your transaction is com..."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(
            text: "notification_drawer".tr,
            backcolor: Colors.white.withOpacity(0.1),
            textcolor: Colors.black,
            iconcolor: Colors.black),
        body: FutureBuilder(
           future: null,
          builder: (context, snapshot) {
            if(snapshot.hasData){

              return  ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(list[index]),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            print("bjhbjh");
                            list.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'delete'.tr,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Row(
                                  children: [
                                    Icon(Icons.notification_add),
                                    AddHorizontalSpace(20.w),
                                    Text(
                                      "notification_drawer".tr,
                                      style: Black16w500,
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          size: 30.h,
                                        )),
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      subtitle: Text(
                                        "After 30 days your account will be deleted permanently",
                                        style: Black15w500,
                                      ),
                                    ),
                                    AddVerticalSpace(20),
                                    CustomButton(
                                      btnText: "confirm".tr,
                                      onPressed: () {},
                                    )
                                  ],
                                ));
                          },
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications_active),
                          title: Text("System"),
                          subtitle: Text("Thank you! Your transaction is com..."),
                        ),
                      ),
                    ),
                  );
                },
              );

            }
            else
              {
                 return Center(child: Image.asset(AppImage.nodataimage));
              }
          },

        ));
  }
}
