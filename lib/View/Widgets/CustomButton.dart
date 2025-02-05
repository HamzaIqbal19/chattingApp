import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton {
  Widget appButton(context,
      {required void Function()? onPressed,
      String buttonText = '',
      Color? buttonBgColor,
      Color? textColor}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: buttonBgColor,
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor,
                fontSize: AppDimensions.font10(context) * 2,
                fontFamily: 'Caros'),
          )),
    );
  }
}
