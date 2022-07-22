import 'dart:ffi';
import 'dart:ui';

import 'package:calculator/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.textButton,
      this.buttonColor,
      this.btnFlex,
      this.callback});
  String? textButton;
  Color? buttonColor;
  int? btnFlex;
  Function? callback;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: btnFlex == null ? 1 : btnFlex!,
      child: GestureDetector(
        onTap: () {
          callback!(textButton);
        },
        child: Container(
          width: 70,
          height: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            textButton!,
            style: Constant.btnTextStyle,
          ),
        ),
      ),
    );
  }
}
