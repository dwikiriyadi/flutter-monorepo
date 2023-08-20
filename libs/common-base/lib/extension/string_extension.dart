import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateExtension on String {
  String convertDateTime(
      {String srcPattern = "yyyy-MM-dd", String dstPattern = "dd MMM yyyy"}) {
    initializeDateFormatting();
    return DateFormat(dstPattern, "id_ID")
        .format(DateFormat(srcPattern).parse(this));
  }

  String toddMMMyyyy() {
    initializeDateFormatting();
    return DateFormat("dd MMM yyyy", "id_ID")
        .format(DateFormat("yyyy-MM-dd").parse(this));
  }

  String toddMMyyyy() {
    initializeDateFormatting();
    return DateFormat("dd/MM/yyyy", "id_ID")
        .format(DateFormat("yyyy-MM-dd").parse(this));
  }

  String toddMMMyyyyHHmm({String from = "yyyy-MM-dd HH:mm:ss"}) {
    initializeDateFormatting();
    return DateFormat("dd MMM yyyy HH:mm", "id_ID")
        .format(DateFormat(from).parse(this));
  }
}

extension ImageExtension on String {
  Uint8List readImage() {
    return base64Decode(this);
  }
}
