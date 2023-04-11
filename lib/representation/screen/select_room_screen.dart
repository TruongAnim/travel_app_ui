import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/data/models/room_model.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/hotel_ultility_item.dart';
import 'package:travel_app_ui/representation/widgets/room_item.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({super.key});
  static const String routeName = '/selectHotelScreen';
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      emplementLeading: true,
      titleString: 'Select Room',
      child: SingleChildScrollView(
        child: Column(
          children: [
            RoomItem(
              roomModel: RoomModel(
                  roomName: 'Deluxe Room',
                  roomArea: 27,
                  roomPrice: 245,
                  roomUtility: 'Free Cancellation',
                  roomImage: AssetsHelper.room1),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            RoomItem(
              roomModel: RoomModel(
                  roomName: 'Executive Suite',
                  roomArea: 32,
                  roomPrice: 289,
                  roomUtility: 'Non-refundable',
                  roomImage: AssetsHelper.room2),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            RoomItem(
              roomModel: RoomModel(
                  roomName: 'King Bed Only Room',
                  roomArea: 24,
                  roomPrice: 214,
                  roomUtility: 'Non-refundable',
                  roomImage: AssetsHelper.room3),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
