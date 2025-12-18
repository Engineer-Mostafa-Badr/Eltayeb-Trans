import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/lists/sliver_list_view_with_pagination.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/res/app_images.dart';
import '../../../onboarding/presentation/widgets/background_widget.dart';
import '../widgets/trips_app_bar.dart';
import '../widgets/trips_home_body_section.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tripsAppBar(),
      body: BlocConsumer<TripsBloc, TripsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = TripsBloc.get(context);
          final pagination = state.responseUtils.pagination;
          final tripsModel = state.responseUtils.data;
          final trips = tripsModel?.trips ?? [];

          final isFirstLoading =
              state.requestUtilsState == RequestState.loading && trips.isEmpty;

          return PullRefreshReuse(
            onRefresh: () async {
              bloc.add(const GetTripsEvent());
            },
            child: Stack(
              children: [
                const BackgroundWidget(image: AssetImagesPath.authBackground),
                if (isFirstLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  CustomScrollView(
                    controller: bloc.tripsScrollController,
                    slivers: [
                      SliverListViewWithPagination<TripModel>(
                        emptyMessage: 'no_matches_today',
                        errorMessage: state.responseUtils.msg,
                        emptyImage: AssetImagesPath.date2SVG,
                        dispose: false,
                        isListLoading:
                            state.requestUtilsState == RequestState.loading &&
                            trips.isNotEmpty,
                        isLoadMoreLoading:
                            state.requestUtilsState == RequestState.loading &&
                            trips.isNotEmpty,
                        totalItems: pagination?.total ?? trips.length,
                        isLastPage:
                            (pagination?.currentPage ?? 1) >=
                            (pagination?.lastPage ?? 1),
                        model: tripsModel,
                        items: trips,
                        itemWidget: (item, index) =>
                            TripsHomeBodySection(trip: item!),
                        onPressedLoadMore: () {
                          if (pagination == null) return;
                          // هنا لما تظبط الـ params بالصفحات هتزود الـ page وتنده GetTripsEvent
                        },
                        scrollController: bloc.tripsScrollController,
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
