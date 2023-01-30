import 'package:common_base/object/result_state.dart';
import 'package:flutter/material.dart';

class ListContent<T> extends StatefulWidget {
  final ResultState<List<T>> result;
  final Widget Function(BuildContext context, T data, int index) itemBuilder;
  final Widget Function(BuildContext context) shimmerBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final Widget? emptyPage;
  final EdgeInsetsGeometry? padding;
  final RefreshCallback onRefresh;
  final ScrollController? scrollController;

  const ListContent(
      {super.key,
      required this.result,
      required this.itemBuilder,
      required this.shimmerBuilder,
      this.emptyPage,
      this.padding,
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
          ? SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: widget.emptyPage!,
              ),
            )
          : ListView.separated(
              padding: widget.padding,
              controller: widget.scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (widget.result.data != null &&
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
              itemCount: _getItemCount(),
            ),
    );
  }

  int _getItemCount() {
    if (widget.result is LoadingState && widget.result.data == null) {
      return 10;
    }

    if (widget.result is LoadingState && widget.result.data!.isNotEmpty) {
      return widget.result.data!.length + 10;
    }

    if (widget.result.data != null && widget.result.data!.isNotEmpty) {
      return widget.result.data!.length;
    }

    return 0;
  }
}
