import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateExtension on DateTime {
  String convertDateTime({String pattern = "dd MMM yyyy"}) {
    initializeDateFormatting();
    return DateFormat(pattern, "id_ID").format(this);
  }
}
