import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:in_app_update/in_app_update.dart';
part 'core/constants/constants.dart';
part 'core/functions/convert_version.dart';
part 'core/extensions/list_extensions.dart';
part 'domain/entities/app_version_data.dart';
part 'domain/repos/fetch_version_repo.dart';
part 'widgets/ios_update_dailog.dart';

///*
class UpdateServices {
  /// Checks for app update in stores, taking into account the local version.
  /// * ```appleId``` unique identifier in Apple Store, if null, we will use your package name.
  /// * ```playStoreId``` unique identifier in Play Store, if null, we will use your package name.
  /// * ```country```, region of store, if null, we will use 'us'.
  /// ## example
  /// ```dart
  /// await AppVersionUpdate.checkForUpdates(
  ///   appleId: '123456789',
  ///   playStoreId: 'com.example.app',
  ///   country: 'br')
  /// .then((data) async {
  ///    if (data.canUpdate!) {
  ///       //action...
  ///     });
  /// ```
  static Future<void> checkForUpdates({
    required PackageInfo packageInfo,
    String? appleId,
    String? country = 'us',
  }) async {
    if (Platform.isIOS) {
      final res = await _UpdateRepo().fetchIOS(packageInfo: packageInfo, appleId: appleId, country: country);
      if (_convertVersion(version: res.localVersion, versionStore: res.storeVersion)) {
        await showDialog<Widget>(
          barrierDismissible: false,
          context: App.navKey.currentContext!,
          builder: (_) => UpdateDialog(updateDetails: res),
        );
      }
      return;
    } else if (Platform.isAndroid) {
      final res = await InAppUpdate.checkForUpdate();
      if (res.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.performImmediateUpdate();
      }
    }
  }
}
