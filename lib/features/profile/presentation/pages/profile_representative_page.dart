import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/editable_info_card.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/general_info_card.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/profile_action_buttons.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/profile_representative_app_bar.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/profile_representative_error_widget.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/profile_representative_header.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/profile_representative_widgets/profile_representative_listener.dart';

class ProfileRepresentativePage extends StatefulWidget {
  const ProfileRepresentativePage({super.key});

  @override
  State<ProfileRepresentativePage> createState() =>
      _ProfileRepresentativePageState();
}

class _ProfileRepresentativePageState extends State<ProfileRepresentativePage> {
  final TextEditingController _phoneController = TextEditingController();
  String? _lastLoadedPhone;

  @override
  void initState() {
    super.initState();
    ProfileBloc.get(context).add(const GetEmployeeProfileEvent());
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _updatePhoneController(String? phone) {
    if (phone != null && phone != _lastLoadedPhone && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _phoneController.text = phone;
          _lastLoadedPhone = phone;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.greyF9Color,
        appBar: const ProfileRepresentativeAppBar(),
        body: SafeArea(
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: ProfileRepresentativeListener.handleStateChanges,
            builder: (context, state) {
              final isLoading =
                  state.getEmployeeProfileState == RequestState.loading;
              final hasError =
                  state.getEmployeeProfileState == RequestState.error;
              final userData = state.getEmployeeProfileResponse.data;

              if (userData != null &&
                  state.getEmployeeProfileState == RequestState.loaded) {
                _updatePhoneController(userData.phone);
              }

              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : hasError || userData == null
                      ? ProfileRepresentativeErrorWidget(
                          errorMessage: state.getEmployeeProfileResponse.msg,
                        )
                      : _buildContent(state, userData);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ProfileState state, userData) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.padding16.w,
        vertical: AppPadding.padding10.h,
      ),
      child: Column(
        children: [
          ProfileRepresentativeHeader(userData: userData),
          AppPadding.padding16.sizedHeight,
          EditableInfoCard(
            userData: userData,
            phoneController: _phoneController,
          ),
          AppPadding.padding16.sizedHeight,
          GeneralInfoCard(userData: userData),
          AppPadding.padding24.sizedHeight,
          ProfileActionButtons(state: state),
          AppPadding.padding20.sizedHeight,
        ],
      ),
    );
  }
}
