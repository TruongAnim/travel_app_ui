import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});
  static const String routeName = '/main';

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: kDefaultIconSize,
                ),
                title: const Text('Home')),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultIconSize,
                ),
                title: const Text('Likes')),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.briefcase,
                  size: kDefaultIconSize,
                ),
                title: const Text('Booking')),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.solidUser,
                  size: kDefaultIconSize,
                ),
                title: const Text('User'))
          ]),
    );
  }
}
