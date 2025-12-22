import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/utils/container_for_bottom_nav_buttons.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/expenses/presentation/pages/my_expenses_page.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:eltyp_delivery/features/notifications/presentation/pages/notifications_representative_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/pages/trips_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, this.index = 0});

  final int index;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final List _pages = const [
    [AssetImagesPath.track, TripsPage(), 'tracks'],
    [AssetImagesPath.wallet, MyExpensesPage(), 'expenses'],
    [
      AssetImagesPath.notification,
      NotificationsRepresentativePage(),
      'notification',
    ],
    [AssetImagesPath.profile, ProfilePage(), 'profile'],
  ];

  @override
  void initState() {
    super.initState();
    TripsBloc.get(context).add(const GetTripsEvent());
    if (AppConst.isLogin) {
      ProfileBloc.get(context).add(const GetProfileEvent());
    }
    if (widget.index > 0 && widget.index < _pages.length) {
      _selectedIndex = widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsBloc, TripsState>(
      buildWhen: (_, current) => false,
      listener: (context, state) {
        if (state.requestUtilsState == RequestState.loaded) {
          // _onItemTapped(1);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _pages[_selectedIndex][1],
          extendBody: true,
          bottomNavigationBar: ContainerForBottomNavButtons(
            padding: const EdgeInsetsDirectional.only(
              top: AppPadding.smallPadding,
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              elevation: 0,
              backgroundColor: Colors.white,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: List.generate(
                _pages.length,
                (index) => BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AssetSvgImage(
                          _pages[index][0],
                          color: index == _selectedIndex
                              ? AppColors.cDarkBlueColor
                              : null,
                        ),
                      ),
                      Text(
                        '${_pages[index][2]}'.tr(),
                        style: AppStyles.title500.copyWith(
                          color: index == _selectedIndex
                              ? AppColors.cDarkBlueColor
                              : AppColors.cTextSubtitleLight,
                        ),
                      ),
                    ],
                  ),

                  label: '',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
