import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/data/models/hotel_model.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/hotel_item_widget.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});
  static const String routeName = '/HotelsScreen';
  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  List<HotelModel> hotels = [
    const HotelModel(
      hotelImage: AssetsHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      stars: 4.5,
      numberOfReview: 3241,
      price: 143,
    ),
    const HotelModel(
      hotelImage: AssetsHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      stars: 4.2,
      numberOfReview: 3241,
      price: 234,
    ),
    const HotelModel(
      hotelImage: AssetsHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      stars: 3.8,
      numberOfReview: 1234,
      price: 132,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    print('hello');
    return AppBarContainer(
      titleString: 'Hotels',
      emplementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...hotels
                .map(
                  (HotelModel model) => HotelItem(hotel: model),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
