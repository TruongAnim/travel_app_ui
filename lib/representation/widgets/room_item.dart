import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/data/models/room_model.dart';
import 'package:travel_app_ui/representation/screen/checkout_screen.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';
import 'package:travel_app_ui/representation/widgets/dash_line.dart';
import 'package:travel_app_ui/representation/widgets/hotel_ultility_item.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({super.key, required this.roomModel});
  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.roomName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: kTopPadding,
                  ),
                  Text(
                    'Room Size: ${roomModel.roomArea} m2',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: kTopPadding,
                  ),
                  Text(
                    roomModel.roomUtility,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                ],
              ),
              ImageHelper.loadFromAsset(
                roomModel.roomImage,
                radius: const BorderRadius.all(
                  Radius.circular(kMinPadding),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          HotelUltilityItem(),
          const DashLineWidget(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.roomPrice.toString()}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: kTopPadding,
                    ),
                    const Text(
                      '/night',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ButtonWidget(
                  title: 'Choose',
                  onTap: () {
                    Navigator.of(context).pushNamed(CheckoutScreen.routeName,
                        arguments: roomModel);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
