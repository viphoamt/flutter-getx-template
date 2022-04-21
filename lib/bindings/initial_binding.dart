import 'package:flutter_getx_base/bindings/local_source_bindings.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    LocalSourceBindings().dependencies();
  }

}