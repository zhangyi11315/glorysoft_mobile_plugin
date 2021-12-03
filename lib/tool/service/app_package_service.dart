
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class AppPackageService extends GetxService {
  Future<PackageInfo> init() async {
    return await PackageInfo.fromPlatform();
  }
}