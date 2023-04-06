import 'package:flutter/material.dart';
import 'package:travel_app_ui/representation/screen/intro_screen.dart';
import 'package:travel_app_ui/representation/screen/main_app.dart';
import 'representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
};
