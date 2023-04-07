import 'package:flutter/material.dart';
import 'package:travel_app_ui/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app_ui/representation/screen/hotel_screen.dart';
import 'package:travel_app_ui/representation/screen/intro_screen.dart';
import 'package:travel_app_ui/representation/screen/main_app.dart';
import 'package:travel_app_ui/representation/screen/select_date_screen.dart';
import 'representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDate.routeName: (context) => SelectDate(),
};
