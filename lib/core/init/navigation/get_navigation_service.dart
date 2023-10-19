import 'package:enelsis/core/init/navigation/inavigation_service.dart';
import 'package:get/get.dart';

class GetNavigationService implements INavgiationService {
  GetNavigationService._init();
  static final GetNavigationService _instance = GetNavigationService._init();
  static GetNavigationService get instance => _instance;
  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await Get.toNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await Get.offAndToNamed(path, arguments: data);
  }
}
