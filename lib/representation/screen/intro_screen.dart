import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/constants/textstyle_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/representation/screen/main_app_screen.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const String routerName = '/IntroScreen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final PageController _pageController;
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      _pageStreamController.add((_pageController.page! + 0.5).toInt());
    });
  }

  Widget _createPageViewItem(String path, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: alignment,
            child: ImageHelper.loadFromAsset(path,
                height: 400, fit: BoxFit.fitHeight)),
        const SizedBox(height: kMediumPadding * 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _createPageViewItem(
                AssetsHelper.intro1,
                'Book a flight',
                '''Found a flight that matches your destination and schedule? Book it instantly.''',
                Alignment.centerRight,
              ),
              _createPageViewItem(
                AssetsHelper.intro2,
                'Find a hotel room',
                '''Select the day, book your room. We give you the best price.''',
                Alignment.center,
              ),
              _createPageViewItem(
                AssetsHelper.intro3,
                'Enjoy your trip',
                '''Easy discovering new places and share these between your friends and travel together.''',
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                        activeDotColor: Colors.orange),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return ButtonWidget(
                        title: snapshot.data! > 1.5 ? 'Get start' : 'Next',
                        onTap: () {
                          if (snapshot.data! > 1.5) {
                            Navigator.of(context)
                                .pushNamed(MainAppScreen.routeName);
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
