import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiuser/utils/constant.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          text: "voucher_drawer".tr,
          backcolor: Colors.white.withOpacity(0.0),
          iconcolor: Colors.black,
          textcolor: Colors.black),
      body: Column(
        children: [

        ],
      )
    );
  }
}
