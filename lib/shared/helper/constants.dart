

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text; // نص الزر
  final VoidCallback onPressed; // وظيفة عند الضغط على الزر
  final Color backgroundColor; // لون خلفية الزر
  final Color textColor; // لون نص الزر
  final double width; // عرض الزر
  final double height; // ارتفاع الزر
  final double borderRadius; // زوايا دائرية للزر

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, // لون افتراضي
    this.textColor = Colors.white, // لون نص افتراضي
    this.width = double.infinity, // عرض افتراضي (يملأ المساحة المتاحة)
    this.height = 50.0, // ارتفاع افتراضي
    this.borderRadius = 10.0, // زوايا دائرية افتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width, // تعيين عرض الزر
        height: height, // تعيين ارتفاع الزر
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // لون النص
              fontSize: 18, // حجم النص
              fontWeight: FontWeight.bold, // سمك النص
            ),
          ),
          onPressed: onPressed, // وظيفة عند الضغط
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, // لون الخلفية
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius), // زوايا دائرية
            ),
          ),
        ));
  }
}

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool enabled;
  final Color textColor; // لون النص
  final Color fillColor; // لون خلفية الحقل
  final double borderRadius; // زوايا دائرية

  const DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.enabled = true,
    this.textColor = Colors.black, // لون نص افتراضي
    this.fillColor = Colors.transparent, // لون خلفية افتراضي
    this.borderRadius = 10.0, // زوايا دائرية افتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        // تفعيل تعبئة الخلفية
        fillColor: fillColor,
        // لون الخلفية
        labelStyle: TextStyle(color: textColor),
        // لون النص
        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
        // لون التلميح
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      style: TextStyle(color: textColor), // لون النص المدخل
    );
  }
}

Future<void> NavigateTo(BuildContext context, Widget widget) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}

Future<void> NavigateAndFinish(BuildContext context, Widget widget) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

AwesomeDialog AwesomeDefault(BuildContext context,
    {String? title, required String desc,
      void Function()? okPressed,DialogType dialogType=DialogType.noHeader
    }) {
  return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      isDense: true,
      animType: AnimType.rightSlide,
      title: title,
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      desc: desc,
      descTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      btnCancelOnPress: () {},
      btnOkOnPress:okPressed
  )..show();
}