import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/core/helpers/local_storage_helper.dart';
import 'package:travel_app_ui/representation/screen/intro_screen.dart';
import 'package:travel_app_ui/representation/screen/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routerName = '/splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    bool? ignoreIntroScreen = LocalStorageHelper.getKey('ignoreIntroScreen');
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    if (ignoreIntroScreen != null && ignoreIntroScreen == true) {
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      Navigator.of(context).pushNamed(IntroScreen.routerName);
      LocalStorageHelper.setKey('ignoreIntroScreen', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetsHelper.splashBackgroundImage,
              fit: BoxFit.fitWidth),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetsHelper.splashCircleImage,
              fit: BoxFit.fitWidth),
        )
      ],
    );
  }
}
