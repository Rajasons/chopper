import 'package:flutter/cupertino.dart';

class HeaderText extends StatelessWidget {
  final String text;
  TextStyle textStyle;

  HeaderText({required this.text,required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
