import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

DraggableScrollableController useDraggableScrollableController({
  Function(DraggableScrollableController controller)? listener,
  List<Object?>? keys,
}) {
  return use(
      _DraggableScrollableControllerHook(listener: listener, keys: keys));
}

class _DraggableScrollableControllerHook
    extends Hook<DraggableScrollableController> {
  const _DraggableScrollableControllerHook({
    this.listener,
    super.keys,
  });

  final Function(DraggableScrollableController controller)? listener;

  @override
  HookState<DraggableScrollableController, Hook<DraggableScrollableController>>
      createState() => _DraggableScrollableControllerHookState();
}

class _DraggableScrollableControllerHookState extends HookState<
    DraggableScrollableController, _DraggableScrollableControllerHook> {
  late final controller = DraggableScrollableController();

  @override
  void initHook() {
    super.initHook();
    if (hook.listener != null) {
      controller.addListener(hook.listener!(controller));
    }
  }

  @override
  DraggableScrollableController build(BuildContext context) => controller;

  void test() {

  }

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useDraggableScrollableController';
}
