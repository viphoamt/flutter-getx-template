import 'package:get/get.dart';

import 'local_source_bindings.dart';
import 'repository_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    LocalSourceBindings().dependencies();
    RepositoryBinding().dependencies();
  }
}
