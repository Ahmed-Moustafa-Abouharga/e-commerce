
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/signin/presentation/pages/signin_screen.dart';
import '../../features/auth/signup/presentation/pages/signup_screen.dart';
import '../../features/main/presentaition/pages/main_view.dart';

class RouteGenerator{

static Route<dynamic>? getRoute(RouteSettings settings)
 {
   switch (settings.name)
   {
     case Routes.signInRoute:
       return MaterialPageRoute(builder: (_)=>SigninView()) ;
     case Routes.signUpRoute:
       return MaterialPageRoute(builder: (_)=>SignupView()) ;
     case Routes.mainRoute:
       return MaterialPageRoute(builder: (context)=>MainView()) ;
   }

 }
}