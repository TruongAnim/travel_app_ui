import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/representation/screen/guest_and_room_screen.dart';
import 'package:travel_app_ui/representation/screen/hotels_screen.dart';
import 'package:travel_app_ui/representation/screen/select_date_screen.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/booking_item_widget.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';
import 'package:travel_app_ui/core/extensions/date_extensions.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, this.destination});

  static const String routeName = '/HotelBookingScreen';
  final String? destination;
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
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
              content: widget.destination ?? 'Destination',
              color: ColorPalette.itemHotelColor,
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(
              builder: (context, setState) => BookingItemWidget(
                icon: AssetsHelper.icoCalender,
                title: 'Select Date',
                content: dateSelected ?? '13 Feb - 18 Feb 2021',
                color: ColorPalette.itemPlaneColor,
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDate.routeName);
                  if ((result as List<DateTime?>)
                      .any((element) => element != null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(
                      () {},
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            BookingItemWidget(
              icon: AssetsHelper.icoBed,
              title: 'Guest and Room',
              content: '2 Guest, 1 Room',
              color: ColorPalette.itemHotelPlaneColor,
              onTap: () {
                Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
