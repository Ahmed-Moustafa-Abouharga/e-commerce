import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.isLoadign = false,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.titleColor = ColorManager.primaryColor,
    this.width = double.infinity,
    this.verticalPadding = 23,
    this.horizontalPadding = 22,  this.fontWeight=FontWeight.w600,  this.fonstSize=20,
  });
  final String title;
  final Color titleColor;
  final bool isLoadign;
  final Color backgroundColor;
  final double width;
  final double verticalPadding;
  final double horizontalPadding;
  final FontWeight fontWeight ;
  final double fonstSize;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: REdgeInsets.symmetric(
              vertical: verticalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            )),
        onPressed: onPressed,
        child: isLoadign
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: titleColor,
                    fontWeight:fontWeight,
                    fontSize: fonstSize.sp),
              ),
      ),
    );
  }
}
