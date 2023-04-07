import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/booking_item_widget.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  static const String routeName = '/HotelBookingScreen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      emplementLeading: true,
      titleString: 'Hotel Booking Screen',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            BookingItemWidget(
              icon: AssetsHelper.icoLocation,
              title: 'Destination',
              content: 'South Korea',
              color: ColorPalette.itemHotelColor,
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            BookingItemWidget(
              icon: AssetsHelper.icoCalender,
              title: 'Select Date',
              content: '13 Feb - 18 Feb 2021',
              color: ColorPalette.itemPlaneColor,
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            BookingItemWidget(
              icon: AssetsHelper.icoBed,
              title: 'Guest and Room',
              content: '2 Guest, 1 Room',
              color: ColorPalette.itemHotelPlaneColor,
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            const ButtonWidget(title: 'Search'),
          ],
        ),
      ),
    );
  }
}
