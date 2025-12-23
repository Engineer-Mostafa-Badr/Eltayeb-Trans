import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:easy_localization/easy_localization.dart';

/// Central error handler for the application
class ErrorHandler {
  /// Gets user-friendly error message from failure
  static String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return (failure as ServerFailure).message?.tr() ??
            'something_went_wrong'.tr();
      case AssetsFailure _:
        return (failure as AssetsFailure).message?.tr() ??
            'something_went_wrong'.tr();
      default:
        return failure.message?.tr() ?? 'something_went_wrong'.tr();
    }
  }

  /// Gets error message from exception message
  static String getErrorMessageFromString(String? message) {
    if (message == null || message.isEmpty) {
      return 'something_went_wrong'.tr();
    }
    return message.tr();
  }
}
