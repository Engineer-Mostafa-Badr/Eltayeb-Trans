import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';

/// Service responsible for monitoring internet connection status
class InternetConnectionService {
  StreamSubscription<InternetStatus>? _subscription;
  bool _connectedToInternet = true;

  bool get isConnected => _connectedToInternet;

  /// Starts monitoring internet connection changes
  StreamSubscription<InternetStatus> startMonitoring({
    required Function() onConnected,
    required Function() onDisconnected,
  }) {
    _subscription?.cancel();
    _subscription = InternetConnection().onStatusChange.listen(
      (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            if (!_connectedToInternet) {
              _connectedToInternet = true;
              onConnected();
              'internet_connected_toast'.showTopSuccessToast;
            }
            break;
          case InternetStatus.disconnected:
            _connectedToInternet = false;
            onDisconnected();
            'internet_disconnected_toast'.showTopErrorToast;
            break;
        }
      },
    );
    return _subscription!;
  }

  /// Stops monitoring internet connection
  void stopMonitoring() {
    _subscription?.cancel();
    _subscription = null;
  }

  /// Disposes the service
  void dispose() {
    stopMonitoring();
  }
}

