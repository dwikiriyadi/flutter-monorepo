import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension Date on String {
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

extension Image on String {
  Uint8List readImage() {
    return base64Decode(this);
  }
}
