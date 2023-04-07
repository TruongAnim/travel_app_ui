import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';
import 'package:travel_app_ui/representation/widgets/guest_and_room_item.dart';

class GuestAndRoomScreen extends StatelessWidget {
  GuestAndRoomScreen({super.key});

  static const String routeName = 'guestAndRoomScreen';

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      emplementLeading: true,
      titleString: 'Add guest and room',
      child: Column(children: [
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        GuestAndRoomItem(
            icon: AssetsHelper.icoGuest, title: 'Guest', content: 0),
        const SizedBox(
          height: kMediumPadding,
        ),
        GuestAndRoomItem(icon: AssetsHelper.icoRoom, title: 'Room', content: 0),
        const SizedBox(
          height: kMediumPadding,
        ),
        ButtonWidget(
          title: 'Done',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ]),
    );
  }
}
