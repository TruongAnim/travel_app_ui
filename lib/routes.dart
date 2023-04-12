import 'package:flutter/material.dart';
import 'package:travel_app_ui/data/models/hotel_model.dart';
import 'package:travel_app_ui/data/models/room_model.dart';
import 'package:travel_app_ui/representation/screen/checkout_screen.dart';
import 'package:travel_app_ui/representation/screen/guest_and_room_screen.dart';
import 'package:travel_app_ui/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app_ui/representation/screen/hotel_detail_screen.dart';
import 'package:travel_app_ui/representation/screen/hotels_screen.dart';
import 'package:travel_app_ui/representation/screen/intro_screen.dart';
import 'package:travel_app_ui/representation/screen/main_app.dart';
import 'package:travel_app_ui/representation/screen/select_date_screen.dart';
import 'package:travel_app_ui/representation/screen/select_room_screen.dart';
import 'representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  SelectDate.routeName: (context) => SelectDate(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  HotelsScreen.routeName: (context) => const HotelsScreen(),
  SelectRoomScreen.routeName: (context) => const SelectRoomScreen(),
};

MaterialPageRoute<dynamic>? generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      HotelModel hotel = settings.arguments as HotelModel;
      return MaterialPageRoute(
        builder: (context) {
          return HotelDetailScreen(hotel: hotel);
        },
      );
    case CheckoutScreen.routeName:
      RoomModel room = settings.arguments as RoomModel;
      return MaterialPageRoute(
        builder: (context) {
          return CheckoutScreen(room: room);
        },
      );
    case HotelBookingScreen.routeName:
      String? destination = settings.arguments as String?;
      return MaterialPageRoute(
        builder: (context) {
          return HotelBookingScreen(destination: destination);
        },
      );
  }
  return null;
}
