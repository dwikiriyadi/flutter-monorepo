import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';

MapController useMapController({
  List<Object?>? keys,
}) {
  return use(_MapControllerHook(keys: keys));
}

class _MapControllerHook extends Hook<MapController> {
  const _MapControllerHook({
    super.keys,
  });

  @override
  HookState<MapController, Hook<MapController>> createState() =>
      _MapControllerHookState();
}

class _MapControllerHookState
    extends HookState<MapController, _MapControllerHook> {
  late final controller = MapController();

  @override
  MapController build(BuildContext context) => controller;

  void test() {}

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useMapController';
}
