import 'package:flutter/material.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/core/helpers/assets_helper.dart';
import 'package:travel_app_ui/core/helpers/image_helper.dart';
import 'package:travel_app_ui/data/models/room_model.dart';
import 'package:travel_app_ui/representation/screen/home_screen.dart';
import 'package:travel_app_ui/representation/screen/main_app.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';
import 'package:travel_app_ui/representation/widgets/room_item.dart';

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
          const SizedBox(
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

  Widget _buildCheckoutItem(
      String icon, String content, String btnString, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(icon),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                content,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            padding: const EdgeInsets.all(kMinPadding),
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorPalette.primaryColor.withOpacity(0.3)),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  btnString,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.primaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> steps = ['Book and Review', 'Payment', 'Confirm'];
    int currentStep = 0;
    return AppBarContainer(
      titleString: 'Checkout',
      emplementLeading: true,
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
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RoomItem(
                    roomModel: room,
                    rooms: 1,
                  ),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  _buildCheckoutItem(AssetsHelper.contact, 'Contact Details',
                      'Add Contact', context),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  _buildCheckoutItem(AssetsHelper.promo, 'Promo Code',
                      'Add Promo Code', context),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  ButtonWidget(
                    title: 'Payment',
                    onTap: () {
                      Navigator.of(context).popUntil(
                          (route) => route.settings.name == MainApp.routeName);
                    },
                  ),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
