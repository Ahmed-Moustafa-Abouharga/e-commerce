import 'package:e_commerce/features/main/home/domain/entities/categories_entity/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';

class CustomCategoryWidget extends StatelessWidget {
   CustomCategoryWidget({required this.category});
CategoryEntity category ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
              category.image??"",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h,),
        Text(category.name??"",),
      ],
    );
  }
}
