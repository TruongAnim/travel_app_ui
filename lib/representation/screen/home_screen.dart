import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app_ui/representation/screen/hotel_screen.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildItemCategory(
      Widget icon, Color color, VoidCallback onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(kItemPadding),
              ),
            ),
            child: icon,
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      // titleString: 'hello',
      // emplementLeading: true,
      // emplementTraling: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi, Jame!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.bell,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.only(top: kMinPadding),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kTopPadding),
                  ),
                  color: Colors.white),
              child: ImageHelper.loadFromAsset(AssetsHelper.person),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultIconSize,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(kDefaultPadding),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetsHelper.icoHotel,
                          height: kMediumIconSize, width: kMediumIconSize),
                      ColorPalette.itemHotelColor, () {
                Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
              }, 'Hotels')),
              const SizedBox(
                width: kMediumPadding,
              ),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetsHelper.icoPlane,
                          height: kMediumIconSize, width: kMediumIconSize),
                      ColorPalette.itemPlaneColor,
                      () {},
                      'Flights')),
              const SizedBox(
                width: kMediumPadding,
              ),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetsHelper.icoHotelPlane,
                          height: kMediumIconSize, width: kMediumIconSize),
                      ColorPalette.itemHotelPlaneColor,
                      () {},
                      'All')),
            ],
          ),
        ],
      ),
    );
  }
}
