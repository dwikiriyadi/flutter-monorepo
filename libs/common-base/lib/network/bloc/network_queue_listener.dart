import 'package:common_base/common_base.dart';
import 'package:common_base/network/bloc/network_queue_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef NetworkQueueListenerBuilder = Function(
    BuildContext context, bool retrying, Map<String, ResultState> results);

class NetworkQueueListener extends StatelessWidget {
  final Widget child;
  final NetworkQueueListenerBuilder listener;

  const NetworkQueueListener(
      {Key? key, required this.child, required this.listener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkQueueViewModel, NetworkQueueState>(
      listener: (context, state) => listener(
        context,
        state.retrying,
        state.results,
      ),
      child: child,
    );
  }
}
