import 'dart:io';

import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class SecureBootstrap {
  // Marker file name. Increment the version suffix if you change the behavior.
  static const _markerName = '.first_run_v1';

  /// Clears secure storage on the very first run after a fresh install,
  /// then creates a marker file so this only happens once.
  static Future<void> run() async {
    final appDir = await getApplicationSupportDirectory();
    final marker = File(p.join(appDir.path, _markerName));

    final freshInstall = !await marker.exists();

    if (freshInstall) {
      try {
        // Wipe all keys from flutter_secure_storage
        // (this clears both iOS Keychain and Android encrypted prefs)
        await di.sl<MainSecureStorage>().deleteAll();
      } catch (_) {
        // Ignore errors so app startup is not blocked
      }

      try {
        // Create the app directory (if needed) and write the marker file
        await appDir.create(recursive: true);
        await marker.writeAsString(DateTime.now().toIso8601String());
      } catch (_) {
        // Ignore errors creating the marker
      }
    }
  }
}
