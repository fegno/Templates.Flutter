// ignore_for_file: public_member_api_docs

part of '../../update_service.dart';

class AppVersionData {
  AppVersionData({this.localVersion, this.storeVersion, this.storeUrl, this.targetPlatform, this.hasUpdate = false});
  String? localVersion;
  String? storeVersion;
  String? storeUrl;
  TargetPlatform? targetPlatform;
  bool hasUpdate;

  Future<bool> launchStore() async {
    return launchUrl(Uri.parse(storeUrl!), mode: LaunchMode.externalApplication);
  }
}
