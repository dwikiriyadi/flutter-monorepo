import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewModelProvider<B extends BlocBase<S>, S extends Equatable>
    extends StatefulWidget {
  final B viewModel;
  final Function(B bloc)? onModelReady;
  final Function(BuildContext context, B bloc, S state)? listener;
  final Widget Function(BuildContext context, B bloc, S state) builder;

  const ViewModelProvider(
      {Key? key,
      required this.viewModel,
      this.onModelReady,
      this.listener,
      required this.builder})
      : super(key: key);

  @override
  State<ViewModelProvider<B, S>> createState() =>
      _ViewModelProviderState<B, S>();
}

class _ViewModelProviderState<B extends BlocBase<S>, S extends Equatable>
    extends State<ViewModelProvider<B, S>> {
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.viewModel,
      child: BlocConsumer<B, S>(
        listener: (context, state) {
          if (widget.listener != null) {
            widget.listener!(context, widget.viewModel, state);
          }
        },
        builder: (context, state) =>
            widget.builder(context, widget.viewModel, state),
      ),
    );
  }
}
