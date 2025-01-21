import 'package:e_commerce/core/cache/shared_prefs_handler.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/features/main/home/presentation/pages/home_view.dart';
import 'package:e_commerce/features/main/presentaition/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_text_field.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  bool isSelected = false;

  List<Widget> screens = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.route_title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              SharedPrefsHandler.deleteToken();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: StringsMangaer.whatDoYouSearchFor,
                    textColor: Theme.of(context).colorScheme.secondary,
                    borderColor: Theme.of(context).colorScheme.primary,
                    borderRadius: 30.r,
                    prefix: Image.asset(ImageAssets.searchIcon),
                  ),
                ),
                SizedBox(
                  width: 26.w,
                ),
                Image.asset(ImageAssets.cart),
              ],
            ),
          ),
          Expanded(child: screens[selectedIndex]),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            color: ColorManager.primaryColor
          ),
          selectedItemColor: ColorManager.primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
           CustomBottomNavBarItem(title: "", iconPath: ImageAssets.home_icon,),
           CustomBottomNavBarItem(title: "", iconPath: ImageAssets.category_icon),
           CustomBottomNavBarItem(title: "", iconPath: ImageAssets.heart_icon),
           CustomBottomNavBarItem(title: "", iconPath: ImageAssets.person_icon),

          ],
        ),
      ),
    );
  }

}
