import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_base/bindings/initial_binding.dart';
import 'package:flutter_getx_base/commons/langs/localization_service.dart';
import 'package:flutter_getx_base/commons/theme/custom_theme.dart';
import 'package:flutter_getx_base/configurations/app_configuration_manager.dart';
import 'package:flutter_getx_base/configurations/environment_configuration_manager.dart';
import 'package:flutter_getx_base/configurations/environment_type.dart';
import 'package:flutter_getx_base/core/controllers/language_controller.dart';
import 'package:flutter_getx_base/core/controllers/theme_controller.dart';
import 'package:flutter_getx_base/network/api_provider.dart';
import 'package:flutter_getx_base/route/route_name.dart';
import 'package:flutter_getx_base/route/route_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfigurationManager.configure(
    environmentType: EnvironmentType.dev,
  );
  final apiProvider = ApiProvider();
  apiProvider.initApiProvider(EnvironmentConfigurationManager
      .instance.environmentConfiguration.baseUrl,);
  Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
  Get.put<LanguageController>(LanguageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.light,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: RoutePage.pages,
      initialBinding: InitialBinding(),
      initialRoute: RouteName.login,
      enableLog: true,
      builder: EasyLoading.init(),
    );
  }
}
