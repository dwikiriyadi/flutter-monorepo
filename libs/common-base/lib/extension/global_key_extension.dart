import 'package:flutter/material.dart';

extension RefreshIndicatorExtension on GlobalKey<RefreshIndicatorState> {
  refreshing() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentState?.show();
    });
  }
}
