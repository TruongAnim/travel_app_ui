import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app_ui/core/constants/color_constants.dart';
import 'package:travel_app_ui/core/constants/dismention_constants.dart';
import 'package:travel_app_ui/representation/widgets/app_bar_container.dart';
import 'package:travel_app_ui/representation/widgets/button_widget.dart';

class SelectDate extends StatelessWidget {
  SelectDate({super.key});
  static const String routeName = '/selectDate';
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
        emplementLeading: true,
        titleString: 'Select date',
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.orangeColor,
              startRangeSelectionColor: ColorPalette.orangeColor,
              endRangeSelectionColor: ColorPalette.orangeColor,
              rangeSelectionColor: ColorPalette.orangeColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.orangeColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                }
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Select',
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Cancel',
              onTap: () {
                Navigator.of(context).pop([null, null]);
              },
            ),
          ],
        ));
  }
}
