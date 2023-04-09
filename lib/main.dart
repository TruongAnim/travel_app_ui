import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/helpers/local_storage_helper.dart';
import 'package:travel_app_ui/representation/screen/splash_screen.dart';
import 'package:travel_app_ui/routes.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: ColorPalette.primaryColor,
          scaffoldBackgroundColor: ColorPalette.backgroundScaffodColor,
          colorScheme: ColorScheme.fromSeed(
              seedColor: ColorPalette.backgroundScaffodColor)),
      routes: routes,
      onGenerateRoute: generateRouter,
      initialRoute: SplashScreen.routerName,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
