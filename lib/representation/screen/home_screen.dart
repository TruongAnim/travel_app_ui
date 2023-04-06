import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      // titleString: 'hello',
      // emplementLeading: true,
      // emplementTraling: true,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Jame!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.only(top: kMinPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kTopPadding),
                  ),
                  color: Colors.white),
              child: ImageHelper.loadFromAsset(AssetsHelper.person),
            )
          ],
        ),
      ),
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
