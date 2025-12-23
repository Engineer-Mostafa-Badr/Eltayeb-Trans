import 'package:flutter/material.dart';
import '../../../../../core/enum/enums.dart';
import '../../bloc/profile_bloc.dart';

class ProfileRepresentativeListener {
  static void handleStateChanges(BuildContext context, ProfileState state) {
    _handleGetProfileError(context, state);
    _handleUpdateProfileSuccess(context, state);
    _handleUpdateProfileError(context, state);
  }

  static void _handleGetProfileError(BuildContext context, ProfileState state) {
    if (state.getEmployeeProfileState == RequestState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.getEmployeeProfileResponse.msg ?? 'حدث خطأ في تحميل البيانات',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  static void _handleUpdateProfileSuccess(
    BuildContext context,
    ProfileState state,
  ) {
    if (state.updateProfileState == RequestState.loaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.updateProfileResponse.msg ?? 'تم تحديث البيانات بنجاح',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
      // Refresh profile data after successful update
      ProfileBloc.get(context).add(const GetEmployeeProfileEvent());
    }
  }

  static void _handleUpdateProfileError(
    BuildContext context,
    ProfileState state,
  ) {
    if (state.updateProfileState == RequestState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.updateProfileResponse.msg ?? 'حدث خطأ في تحديث البيانات',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

