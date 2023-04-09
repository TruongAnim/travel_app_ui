import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/data/models/hotel_model.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';
import 'package:travel_app_ui/representation/widgets/dash_line.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotel});

  final HotelModel hotel;

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
              child: const Icon(
                FontAwesomeIcons.solidHeart,
                color: Colors.pink,
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.7,
            minChildSize: 0.3,
            initialChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
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
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.hotel.hotelName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Spacer(),
                              Text(
                                '\$${widget.hotel.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Text(
                                '/night',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                  AssetsHelper.icoLocation),
                              const SizedBox(
                                width: kMinPadding,
                              ),
                              Text(widget.hotel.location),
                            ],
                          ),
                          const DashLineWidget(),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetsHelper.icoStar),
                              const SizedBox(
                                width: kMinPadding,
                              ),
                              Text('${widget.hotel.stars}/5'),
                              const SizedBox(
                                width: kMinPadding,
                              ),
                              Text(
                                '{${widget.hotel.numberOfReview.toString()} reviews}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const DashLineWidget(),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                            'Information',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                              '''You will find every comfort because many of the 
services that the hotel offers for travellers and of 
course the hotel is very comfortable.'''),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                            'Location',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                              '''Located in the famous neighborhood of Seoul, 
Grand Luxury’s is set in a building built in the 
2010s.'''),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          ImageHelper.loadFromAsset(
                            AssetsHelper.map,
                            radius: const BorderRadius.all(
                              Radius.circular(kItemPadding),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const ButtonWidget(title: 'Select Room'),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                        ],
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
