part of '../../update_service.dart';

class _UpdateRepo {
  ///* This constructor body for creating singleton widget
  factory _UpdateRepo() {
    return _updateRepo ??= const _UpdateRepo._();
  }

  //* This named constructor for create object for this class
  const _UpdateRepo._();

  //* This variable for store this class object globally
  static _UpdateRepo? _updateRepo;

  Future<AppVersionData> fetchIOS({
    PackageInfo? packageInfo,
    String? appleId,
    String? country,
  }) async {
    assert(
      appleId != null || packageInfo != null,
      'One between appleId or packageInfo must not be null',
    );
    final parameters = (appleId != null) ? {'id': appleId} : {'bundleId': packageInfo?.packageName};
    if (country != null) {
      parameters['country'] = country;
    }

    final response = await Dio().get<dynamic>(
      '$_appleStoreAuthority/lookup',
      queryParameters: parameters,
      options: Options(headers: _headers),
    );
    if (response.statusCode == 200) {
      final jsonResult = response.data as Map<String, dynamic>;
      final results = jsonResult['results'] as List?;
      if (results?.isNotEmpty ?? false) {
        return AppVersionData(
          storeVersion: jsonResult['results'].first['version'] as String?,
          storeUrl: jsonResult['results'].first['trackViewUrl'] as String?,
          localVersion: packageInfo?.version,
          targetPlatform: TargetPlatform.iOS,
        );
      }
    }
    throw Exception(' Aplication not found in Apple Store, verify your app id. ');
  }
}
