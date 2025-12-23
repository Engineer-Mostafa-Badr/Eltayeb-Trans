import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/navigation_extensions.dart';
import '../../../../core/enum/enums.dart';
import '../../../home/presentation/pages/trip_representative_page.dart';
import '../bloc/login/login_bloc.dart';

class LoginRepresentativeListener extends StatelessWidget {
  final Widget child;

  const LoginRepresentativeListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.representativeLoginRequestState !=
          current.representativeLoginRequestState,
      listener: (context, state) {
        _handleLoginState(context, state);
      },
      child: child,
    );
  }

  void _handleLoginState(BuildContext context, LoginState state) {
    final requestState = state.representativeLoginRequestState;
    final response = state.representativeLoginResponse;

    if (requestState == RequestState.loaded) {
      final isSuccess = response.status == true && response.data != null;

      if (isSuccess) {
        _showSuccessMessage(context, response.msg);
        _navigateToHome(context);
      } else {
        _showErrorMessage(context, response.msg);
      }
    } else if (requestState == RequestState.error) {
      _showErrorMessage(context, response.msg);
    }
  }

  void _showSuccessMessage(BuildContext context, String? message) {
    if (message != null && message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  void _showErrorMessage(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'حدث خطأ'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.navigateToPageWithClearStack(
          const TripsRepresentativePage(),
        );
      }
    });
  }
}

