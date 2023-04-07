import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';

class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.content,
      required this.color,
      required this.onTap});

  final String icon;
  final String title;
  final String content;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(kItemPadding),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(kItemPadding),
                ),
              ),
              child: Image.asset(
                icon,
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  content,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
