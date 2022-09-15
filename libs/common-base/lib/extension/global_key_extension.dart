import 'package:flutter/material.dart';

extension RefreshIndicator on GlobalKey<RefreshIndicatorState> {
  refreshing() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentState?.show();
    });
  }
}
