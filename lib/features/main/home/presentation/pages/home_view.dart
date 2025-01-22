
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/DI/di.dart';
import '../manager/category/category_cubit.dart';
import '../widgets/custom_ad_item.dart';
import '../widgets/custom_category_widget.dart';
import '../widgets/custom_page_indicator.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..getCategories(),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return CustomAdItem();
                    },
                  ),
                ),
                Positioned(
                    bottom: 40.h,
                    child: CustomPageIndicator(pageController: pageController)),
              ],
            ),
            Row(
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Spacer(),
                Text(
                  "view all",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
              buildWhen:(previous, current) {
                if(current is CategoryLoading ||
                current is CategorySuccess ||
                current is CategoryError)
                  {
                    return true;
                  }
                else{
                  return false;
                }
              } ,
              builder: (context, state) {
                if(state is CategorySuccess)
                  {
                    return SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoriesEntity.data?.length??0,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => CustomCategoryWidget(category: state.categoriesEntity.data![index],),
                      ),
                    );
                  }
                if(state is CategoryError)
                  {
                   return Center(child: Text(state.errorMsg)) ;
                  }
                return Center(child: CircularProgressIndicator(),);

              },
            ),

          ],
        ),
      ),
    );
  }
}
