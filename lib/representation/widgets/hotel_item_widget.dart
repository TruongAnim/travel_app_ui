import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/data/models/hotel_model.dart';
import 'package:travel_app_ui/representation/screen/hotel_detail_screen.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';
import 'package:travel_app_ui/representation/widgets/dash_line.dart';

class HotelItem extends StatefulWidget {
  const HotelItem({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  State<HotelItem> createState() => _HotelItemState();
}

class _HotelItemState extends State<HotelItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultPadding),
        ),
      ),
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              widget.hotel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.hotelName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetsHelper.icoLocation2),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(widget.hotel.location),
                    Expanded(
                      child: Text(
                        ' - ${widget.hotel.awayKilometer} from destination',
                        style: const TextStyle(
                            fontSize: 13, color: ColorPalette.subTitleColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetsHelper.icoStar),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(widget.hotel.stars.toString()),
                    Text(
                      ' {${widget.hotel.numberOfReview} review}',
                      style: const TextStyle(
                          fontSize: 12, color: ColorPalette.subTitleColor),
                    )
                  ],
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${widget.hotel.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: kTopPadding,
                          ),
                          const Text('/night'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Book a room',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(HotelDetailScreen.routeName);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
