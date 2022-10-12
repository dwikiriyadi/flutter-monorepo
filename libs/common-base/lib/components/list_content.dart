import 'package:common_base/object/result_state.dart';
import 'package:flutter/material.dart';

class ListContent<T> extends StatefulWidget {
  final ResultState<List<T>> result;
  final Widget Function(BuildContext context, T data, int index) itemBuilder;
  final Widget Function(BuildContext context) shimmerBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final Widget? emptyPage;
  final RefreshCallback onRefresh;
  final ScrollController? scrollController;

  const ListContent(
      {super.key,
        required this.result,
        required this.itemBuilder,
        required this.shimmerBuilder,
        this.emptyPage,
        required this.onRefresh,
        this.scrollController,
        required this.separatorBuilder});

  @override
  State<StatefulWidget> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: widget.key,
      onRefresh: widget.onRefresh,
      child: (widget.result is SuccessState &&
          widget.result.data == null &&
          widget.emptyPage != null)
          ? widget.emptyPage!
          : ListView.separated(
        controller: widget.scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (widget.result.data != null ||
              widget.result.data!.isNotEmpty) {
            if (index >= widget.result.data!.length) {
              return widget.shimmerBuilder(context);
            }
            return widget.itemBuilder(
                context, widget.result.data![index], index);
          } else {
            return widget.shimmerBuilder(context);
          }
        },
        separatorBuilder: widget.separatorBuilder,
        itemCount: (widget.result.data == null)
            ? 10
            : (widget.result is LoadingState &&
            (widget.result.data != null ||
                widget.result.data!.isNotEmpty))
            ? widget.result.data!.length + 10
            : widget.result.data!.length,
      ),
    );
  }
}
