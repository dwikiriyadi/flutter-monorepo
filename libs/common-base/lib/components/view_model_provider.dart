import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewModelProvider<B extends BlocBase<S>, S extends Equatable>
    extends StatefulWidget {
  final B viewModel;
  final Function(B bloc)? onModelReady;
  final Function(B bloc)? onChangeDependencies;
  final bool consumeOnly;
  final Function(BuildContext context, B bloc, S state)? listener;
  final BlocListenerCondition<S>? listenWhen;
  final Widget Function(BuildContext context, B bloc, S state) builder;

  const ViewModelProvider(
      {super.key,
      required this.viewModel,
      this.onChangeDependencies,
      this.onModelReady,
      this.listener,
      required this.builder,
      this.consumeOnly = false,
      this.listenWhen});

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
  void didChangeDependencies() {
    if (widget.onChangeDependencies != null) {
      widget.onChangeDependencies!(widget.viewModel);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.consumeOnly) {
      return BlocConsumer<B, S>(
        listener: (context, state) {
          if (widget.listener != null) {
            widget.listener!(context, widget.viewModel, state);
          }
        },
        builder: (context, state) =>
            widget.builder(context, widget.viewModel, state),
      );
    }

    return BlocProvider.value(
      value: widget.viewModel,
      child: BlocConsumer<B, S>(
        listenWhen: widget.listenWhen,
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
