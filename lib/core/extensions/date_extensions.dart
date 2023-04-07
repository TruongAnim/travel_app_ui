import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get getStartDate {
    DateFormat dateFormat = DateFormat('dd MMM');
    return dateFormat.format(this);
  }

  String get getEndDate {
    DateFormat dateFormat = DateFormat('dd MMM yyyy');
    return dateFormat.format(this);
  }
}
