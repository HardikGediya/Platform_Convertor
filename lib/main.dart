import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platform_convertor_app/utils/appRoutes.dart';
import 'package:platform_convertor_app/utils/colours.dart';
import 'package:platform_convertor_app/utils/routes.dart';

import 'models/user_models.dart';
import 'screens/cupertino_home_screen/page/cupertino_home_screen.dart';
import 'utils/var.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isIOS)
        ? ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context) {
              return CupertinoApp(
                theme: CupertinoThemeData(
                  brightness: (cupLight) ? Brightness.light : Brightness.dark,
                ),
                debugShowCheckedModeBanner: false,
                // initialRoute: CupertinoAppRoutes().cupertinoHomePage,
                // routes: cupertinoRoutes,
                home: const CupertinoHomePage(),
              );
            },
          )
        : ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context) {
              return MaterialApp(
                theme: ThemeData(
                  textTheme: TextTheme(
                    bodyMedium: const TextStyle(
                      color: Colors.white,
                    ),
                    bodySmall: const TextStyle(
                      color: Colors.black,
                    ),
                    bodyLarge: TextStyle(color: mainColor),
                  ),
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.black,
                  brightness: Brightness.dark,
                  textTheme: TextTheme(
                    bodyMedium: const TextStyle(
                      color: Colors.black,
                    ),
                    bodySmall: const TextStyle(
                      color: Colors.white,
                    ),
                    bodyLarge: TextStyle(
                      color: mainColor,
                    ),
                  ),
                ),
                themeMode: (light) ? ThemeMode.light : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes().homePage,
                routes: routes,
              );
            },
          );
  }
}
