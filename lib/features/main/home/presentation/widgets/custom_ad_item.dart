import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';


class CustomAdItem extends StatelessWidget {
  const CustomAdItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Stack(
        children: [
          Image.asset(ImageAssets.onBoard),
          Positioned(
            top: 33.h,
            left: 16.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsMangaer.upTo,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  StringsMangaer.off,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  StringsMangaer.forAllHeadphones,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                CustomElevatedButton(
                  width: 113,
                  fonstSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  verticalPadding: 10,
                  horizontalPadding: 22,
                  title: StringsMangaer.shopNow,
                  onPressed: () {},
                  backgroundColor:
                  Theme.of(context).colorScheme.primary,
                  titleColor: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
