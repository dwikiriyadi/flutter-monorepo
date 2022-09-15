import 'package:intl/intl.dart';

extension NumberParser on double {
  String simpleNumber() {
    if (this > 1000000) return "${(this / 1000000).toStringAsFixed(1)}M";
    if (this > 1000) return "${(this / 1000).toStringAsFixed(1)}K";

    return toStringAsFixed(0);
  }

  String rupiah() {
    var formatter = NumberFormat.currency(locale: "ID");
    return formatter.format(this).replaceAll("IDR", "Rp. ");
  }

  String currency() {
    var formatter = NumberFormat("#,##,##0", "ID");
    return formatter.format(this);
  }
}
