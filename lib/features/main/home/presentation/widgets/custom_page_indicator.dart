import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  CustomPageIndicator ({required this.pageController});
PageController  pageController  ;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
    effect: SwapEffect(
    dotColor: Colors.white,
activeDotColor: Theme.of(context).colorScheme.primary,
dotWidth: 10.w,
dotHeight: 10.h,
),
axisDirection: Axis.horizontal,
controller: pageController,
count: 3);
  }
}
