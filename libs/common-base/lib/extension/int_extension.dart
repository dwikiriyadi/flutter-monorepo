import 'package:intl/intl.dart';

extension DateTimeParser on int {
  String toDateCounter() {
    var now = DateTime.now();
    var date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    var diff = now.difference(date);
    var format = DateFormat("dd MMM yyyy H:m");

    if (diff.inDays > 7) {
      return format.format(date);
    } else if (diff.inDays >= 1) {
      return '${diff.inDays} hari yang lalu';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} jam yang lalu';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} menit yang lalu';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} detik yang lalu';
    } else {
      return 'baru saja';
    }
  }

  String withZero() => "$this".length == 1 ? "0$this" : "$this";

  String toTimer() {
    var date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    var format = DateFormat('mm:ss');

    return format.format(date);
  }
}
