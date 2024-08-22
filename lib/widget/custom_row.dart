import 'package:flutter/cupertino.dart';

class CustomRow extends StatelessWidget {
 List<Widget> children;
 MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;


 CustomRow({this.crossAxisAlignment,this.mainAxisAlignment, required this.children});

 @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment : mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start ,
      children:children ,
    );
  }
}
