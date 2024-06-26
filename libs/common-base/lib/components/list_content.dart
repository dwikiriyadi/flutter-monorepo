import 'package:common_base/extension/nullable_list_extension.dart';
import 'package:common_base/extension/result_state_extension.dart';
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
  final Key? refreshIndicatorKey;

  const ListContent(
      {super.key,
      this.refreshIndicatorKey,
      required this.result,
      required this.itemBuilder,
      required this.shimmerBuilder,
      this.emptyPage,
      this.padding,
      required this.onRefresh,
      this.scrollController,
      required this.separatorBuilder});

  @override
  State<StatefulWidget> createState() => _ListContentState<T>();
}

class _ListContentState<T> extends State<ListContent<T>> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) => RefreshIndicator(
      key: widget.refreshIndicatorKey,
      onRefresh: widget.onRefresh,
      child: ((widget.result.isSuccess || widget.result.isIdle) &&
          widget.result.data.isNullOrEmpty &&
          widget.emptyPage != null)
          ? SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight
          ),
          child: widget.emptyPage!,
        ),
      )
          : Scrollbar(child: PageStorage(
        bucket: PageStorageBucket(),
        child: ListView.separated(
          key: PageStorageKey((widget.result.data?.length ?? 0).runtimeType.toString()),
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
      )),
    ));
  }

  int _getItemCount() {
    if (widget.result.isLoading && widget.result.data == null) {
      return 10;
    }

    if (widget.result.isLoading && widget.result.data!.isNotEmpty) {
      return widget.result.data!.length + 10;
    }

    if (widget.result.data != null && widget.result.data!.isNotEmpty) {
      return widget.result.data!.length;
    }

    return 0;
  }
}
