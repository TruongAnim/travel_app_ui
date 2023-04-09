import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/hotel_ultility_item.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({super.key});
  static const String routeName = '/selectHotelScreen';
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      emplementLeading: true,
      titleString: 'Select Room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          HotelUltilityItem(),
        ],
      ),
    );
  }
}
