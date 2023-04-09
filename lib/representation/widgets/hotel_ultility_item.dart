import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';

class HotelUltilityItem extends StatelessWidget {
  HotelUltilityItem({super.key});

  final List<Map<String, String>> ultilities = [
    {'icon': AssetsHelper.icoWifi, 'name': 'Free\nWifi'},
    {'icon': AssetsHelper.icoRefund, 'name': 'Non-\nRefundable'},
    {'icon': AssetsHelper.icoBreakfast, 'name': 'Free\nBreakfast'},
    {'icon': AssetsHelper.icoNonsmoke, 'name': 'Non\nSmoking'},
  ];

  Widget _buildUltilityItem(String icon, String name) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        const SizedBox(
          height: kTopPadding,
        ),
        Text(
          name,
          style: const TextStyle(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...ultilities.map((e) => _buildUltilityItem(e['icon']!, e['name']!)),
        ],
      ),
    );
  }
}
