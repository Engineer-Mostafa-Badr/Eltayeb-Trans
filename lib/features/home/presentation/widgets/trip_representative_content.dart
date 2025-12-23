import 'package:eltyp_delivery/features/home/domain/entities/get_trips_params.dart';
import '../../../../core/components/lists/sliver_list_view_with_pagination.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import '../../../onboarding/presentation/widgets/background_widget.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/res/app_images.dart';
import 'trip_filter_and_search_section.dart';
import 'package:flutter/material.dart';
import 'trip_representative_card.dart';

class TripRepresentativeContent extends StatefulWidget {
  const TripRepresentativeContent({super.key});

  @override
  State<TripRepresentativeContent> createState() =>
      _TripRepresentativeContentState();
}

class _TripRepresentativeContentState extends State<TripRepresentativeContent> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String?> _selectedStatus = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _fromDate = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _toDate = ValueNotifier<String?>(null);

  static const _primaryColor = Color(0xFF6B1D1D);
  static const _padding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<TripsBloc>().add(const GetTripsEvent()),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _selectedStatus.dispose();
    _fromDate.dispose();
    _toDate.dispose();
    super.dispose();
  }

  void _loadTrips() {
    final searchText = _searchController.text.trim();
    context.read<TripsBloc>().add(
      GetTripsEvent(
        params: GetTripsParams(
          filterStatus: _selectedStatus.value,
          search: searchText.isNotEmpty ? searchText : null,
          from: _fromDate.value,
          to: _toDate.value,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<TripsBloc, TripsState>(
        listener: (context, state) {
          if (state.requestUtilsState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.responseUtils.msg ?? 'حدث خطأ ما'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          final bloc = context.read<TripsBloc>();
          final trips = state.responseUtils.data?.trips ?? [];
          final isLoading = state.requestUtilsState == RequestState.loading;
          final pagination = state.responseUtils.pagination;

          if (isLoading && trips.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: _primaryColor),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => _loadTrips(),
            child: Stack(
              children: [
                const BackgroundWidget(image: AssetImagesPath.authBackground),
                CustomScrollView(
                  controller: bloc.tripsScrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: _padding,
                        child: ValueListenableBuilder<String?>(
                          valueListenable: _selectedStatus,
                          builder: (_, selectedStatus, _) {
                            return ValueListenableBuilder<String?>(
                              valueListenable: _fromDate,
                              builder: (_, fromDate, _) {
                                return ValueListenableBuilder<String?>(
                                  valueListenable: _toDate,
                                  builder: (_, toDate, _) {
                                    return TripFilterAndSearchSection(
                                      searchController: _searchController,
                                      selectedStatus: selectedStatus,
                                      fromDate: fromDate,
                                      toDate: toDate,
                                      onStatusChanged: (status) {
                                        _selectedStatus.value = status;
                                        _loadTrips();
                                      },
                                      onSearchChanged: _loadTrips,
                                      onDateRangeSelected: (from, to) {
                                        _fromDate.value = from;
                                        _toDate.value = to;
                                        _loadTrips();
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SliverListViewWithPagination<TripModel>(
                      emptyMessage: 'لا توجد رحلات',
                      errorMessage: state.responseUtils.msg,
                      dispose: false,
                      isListLoading: isLoading && trips.isNotEmpty,
                      isLoadMoreLoading: isLoading && trips.isNotEmpty,
                      totalItems: pagination?.total ?? trips.length,
                      isLastPage:
                          (pagination?.currentPage ?? 1) >=
                          (pagination?.lastPage ?? 1),
                      model: state.responseUtils.data,
                      items: trips,
                      itemWidget: (item, _) =>
                          TripRepresentativeCard(trip: item!),
                      onPressedLoadMore: () {
                        if (pagination == null) return;
                        // هنا لما تظبط الـ params بالصفحات هتزود الـ page وتنده GetTripsEvent
                      },
                      scrollController: bloc.tripsScrollController,
                      padding: _padding,
                      separator: const SizedBox(height: 12),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
