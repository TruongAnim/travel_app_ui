import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/constants/textstyle_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const String routerName = '/IntroScreen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  Widget _createPageViewItem(String path, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      children: [
        Container(alignment: alignment, child: ImageHelper.loadFromAsset(path)),
        const SizedBox(height: kMediumPadding * 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _createPageViewItem(
            AssetsHelper.intro1,
            'Book a flight',
            '''Found a flight that matches your destination 
and schedule? Book it instantly.''',
            Alignment.centerRight,
          ),
          _createPageViewItem(
            AssetsHelper.intro2,
            'Find a hotel room',
            '''Select the day, book your room. We give you 
the best price.''',
            Alignment.center,
          ),
          _createPageViewItem(
            AssetsHelper.intro3,
            'Enjoy your trip',
            '''Easy discovering new places and share these 
between your friends and travel together.''',
            Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
