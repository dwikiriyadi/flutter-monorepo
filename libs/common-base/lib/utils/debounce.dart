import 'dart:async';

import 'package:flutter/widgets.dart';

class Debounce {
  Debounce({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
