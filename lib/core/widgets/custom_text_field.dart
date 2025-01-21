import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.suffix,
      this.textController,
      this.validate,
      this.prefix,
      this.borderColor = Colors.white,
      required this.borderRadius,
      this.textColor=Colors.black});
  final String hintText;
  final IconData? suffix;
  final Widget? prefix;
  final Color borderColor;
  final double borderRadius;
  final TextEditingController? textController;
  final String? Function(String?)? validate;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: Icon(suffix),
        prefixIcon: prefix,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 18.sp,
              color: textColor?.withOpacity(0.7),
            ),
      ),
    );
  }
}
