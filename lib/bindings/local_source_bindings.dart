import 'package:flutter_getx_base/data/local/preference_manager.dart';
import 'package:flutter_getx_base/data/local/preference_manager_impl.dart';
import 'package:get/get.dart';

class LocalSourceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      tag: (PreferenceManager).toString(),
      fenix: true,
    );
  }
}
