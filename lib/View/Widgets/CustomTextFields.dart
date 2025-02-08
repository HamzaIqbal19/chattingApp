import 'package:flutter/material.dart';

class CustomTextField {
  textField({
    controller,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    bool? enable,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      cursorColor: Color.fromARGB(255, 132, 133, 133),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: enable == true ? Colors.red : const Color(0XFFCDD1D0))),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: enable == true ? Colors.red : const Color(0XFFCDD1D0))),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: enable == true ? Colors.red : const Color(0XFFCDD1D0))),
      ),
    );
  }
}
