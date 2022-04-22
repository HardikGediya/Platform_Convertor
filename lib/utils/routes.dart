import 'package:flutter/cupertino.dart';


import '../screens/home_screen/page/home_screen.dart';
import 'appRoutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => const HomePage()
};


Map<String, Widget Function(BuildContext)> cupertinoRoutes = {
  CupertinoAppRoutes().cupertinoHomePage: (context) => const HomePage()
};
