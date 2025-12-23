import 'package:eltyp_delivery/core/components/screen_status/loading_widget.dart';
import 'package:eltyp_delivery/core/components/screen_status/error_widget.dart';
import 'package:eltyp_delivery/core/components/screen_status/empty_widget.dart';
import 'package:eltyp_delivery/core/components/lists/load_more_button.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class SliverListViewWithPagination<T> extends StatefulWidget {
  const SliverListViewWithPagination({
    super.key,
    this.isListLoading = true,
    this.model,
    this.items,
    required this.emptyMessage,
    required this.errorMessage,
    required this.itemWidget,
    this.isLoadMoreLoading = false,
    this.isLastPage = false,
    this.onPressedLoadMore,
    this.emptyImage,
    this.isScrollable = true,
    this.padding = EdgeInsets.zero,
    required this.totalItems,
    this.separator,
    required this.scrollController,
    this.dispose = true,
  });

  final bool isListLoading;
  final bool dispose;
  final bool isLoadMoreLoading;
  final bool isLastPage;
  final dynamic model;
  final List<dynamic>? items;
  final Widget Function(T? item, int index) itemWidget;
  final VoidCallback? onPressedLoadMore;
  final bool isScrollable;
  final EdgeInsetsGeometry padding;
  final String emptyMessage;
  final String? errorMessage;
  final String? emptyImage;
  final int totalItems;
  final Widget? separator;
  final ScrollController scrollController;

  @override
  State<SliverListViewWithPagination<T>> createState() =>
      _SliverListViewWithPaginationState<T>();
}

class _SliverListViewWithPaginationState<T>
    extends State<SliverListViewWithPagination<T>> {
  @override
  void initState() {
    super.initState();
    _listenToScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.dispose) widget.scrollController.dispose();
  }

  void _listenToScrollController() {
    widget.scrollController.addListener(() {
      // load before reaching the end of the list by 100 pixels
      if (widget.scrollController.position.pixels >=
          widget.scrollController.position.maxScrollExtent - 100) {
        if (!widget.isLoadMoreLoading &&
            !widget.isLastPage &&
            widget.items != null &&
            widget.items!.isNotEmpty) {
          widget.onPressedLoadMore!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMoreThanMaxPerPage =
        widget.items != null && widget.totalItems > PaginationModel.maxPerPage;

    return widget.isListLoading
        ? const LoadingWidget(fillRemaining: true)
        : widget.model == null
        ? ErrorBody(
            // emptyImage: widget.emptyImage,
            errorMessage: widget.errorMessage,
            fillRemaining: true,
          )
        : widget.items == null || widget.items!.isEmpty
        ? EmptyBody(
            emptyImage: widget.emptyImage,
            text: widget.emptyMessage,
            fillRemaining: true,
          )
        : SliverPadding(
            padding: widget.padding,
            sliver: SliverList.separated(
              separatorBuilder: (context, index) =>
                  widget.separator ??
                  const SizedBox(height: AppPadding.largePadding),
              itemCount: isMoreThanMaxPerPage
                  ? widget.items!.length + 1
                  : widget.items!.length,
              itemBuilder: (context, index) {
                if (isMoreThanMaxPerPage && index == widget.items!.length) {
                  return LoadMoreButton(
                    isLoading: widget.isLoadMoreLoading,
                    isLastPage: widget.isLastPage,
                    onPressed: widget.onPressedLoadMore,
                  );
                }
                return widget.itemWidget(widget.items![index], index);
              },
            ),
          );
  }
}
