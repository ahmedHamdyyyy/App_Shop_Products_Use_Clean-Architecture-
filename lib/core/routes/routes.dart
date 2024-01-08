/*

import 'package:api/config/constants/constance.dart';
import 'package:api/feature/auth/screen/splash.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/screen/regest.dart';

class AppRoutes{
  Route<dynamic> appRoute(RouteSettings route) {
    if(route.name ==AppConst.splashScreen) return _route(const SplashScreen());
    if(route.name ==AppConst.signUpScreen) return _route(const RegesterScreen());
 return _wrongRoute();
  }
  Route _route(Widget page) => MaterialPageRoute(builder: (context) => page);
  Route _wrongRoute() => _route(Scaffold(appBar: AppBar(title: const Text('wrong route'))));

}*/
