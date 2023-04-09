import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key});

  static const String routeName = 'HotelDetailScreen';

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetsHelper.hotelDetail,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 2,
            left: kMediumPadding,
            child: Container(
              padding: const EdgeInsets.all(kItemPadding),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                  color: Colors.white),
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.grey[800],
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 2,
            right: kMediumPadding,
            child: Container(
              padding: const EdgeInsets.all(kItemPadding),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                  color: Colors.white),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color: Colors.pink,
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.3,
            initialChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Container(
                      width: 60,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
