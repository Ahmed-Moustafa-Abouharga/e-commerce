
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/DI/di.dart';
import 'core/cache/shared_prefs_handler.dart';
import 'core/resources/styles_manager.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
 await SharedPrefsHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(432, 930) ,
      builder:(context, child) =>  MaterialApp (
        debugShowCheckedModeBanner: false,
        theme: AppStyle.lightTheme,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute:SharedPrefsHandler.getToken().isNotEmpty? Routes.mainRoute:Routes.signInRoute,
      ),
    );
  }
}

