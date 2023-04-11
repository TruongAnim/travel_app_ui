import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/data/models/room_model.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.room});
  final RoomModel room;

  static const String routeName = '/CheckoutScreen';

  Widget _buildCheckoutStep(
      int index, String step, bool isEnd, bool isChecked) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            color: isChecked ? Colors.white : Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(kMediumPadding),
          ),
          child: Text(
            '$index',
            style: TextStyle(
                color: isChecked ? ColorPalette.primaryColor : Colors.white,
                fontWeight: isChecked ? FontWeight.w500 : FontWeight.normal),
          ),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        Text(
          step,
          style: TextStyle(
              color: Colors.white,
              fontWeight: isChecked ? FontWeight.w500 : FontWeight.normal),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        const SizedBox(
          width: kMinPadding,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> steps = ['Book and Review', 'Payment', 'Confirm'];
    int currentStep = 0;
    return AppBarContainer(
      titleString: 'Checkout',
      emplementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ...steps
                    .map(
                      (e) => _buildCheckoutStep(
                          steps.indexOf(e) + 1,
                          e,
                          steps.indexOf(e) + 1 == steps.length,
                          steps.indexOf(e) <= currentStep ? true : false),
                    )
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
