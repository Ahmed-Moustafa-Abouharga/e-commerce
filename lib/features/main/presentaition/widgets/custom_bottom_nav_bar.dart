
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  final String title;
  final String iconPath;

  CustomBottomNavBarItem({required this.title, required this.iconPath})
      : super(
          icon: ImageIcon(AssetImage(iconPath),color:Colors.white ,),
          label: title,
     activeIcon:CircleAvatar(
       backgroundColor: Colors.white,
       child: ImageIcon(AssetImage(iconPath),color: ColorManager.primaryColor,),
     )
        );
}
