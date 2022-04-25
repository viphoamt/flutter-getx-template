import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/utils/styles/text_styles_app.dart';
import 'package:flutter_getx_base/core/controllers/theme_controller.dart';
import 'package:flutter_getx_base/futures/auth/login/login_controller.dart';
import 'package:flutter_getx_base/widgets/icon/leading_icon.dart';
import 'package:flutter_getx_base/widgets/screen_layout.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.to;
    final themeController = ThemeController.to;
    return ScreenLayout(
      actions: const [
        LeadingIcon(
          color: Colors.black,
        ),
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: controller.getWeather,
            child: Text(
              'login'.tr,
              style: TextStyleApp.bodyText1(),
            ),
          ),
          Obx(
            () => CupertinoSwitch(
              value: controller.switchValue.value,
              onChanged: (value) {
                controller.changeValue();
                themeController.setThemeMode(value ? 'light' : 'dark');
              },
            ),
          ),
          OutlinedButton(
            onPressed: () => Get.updateLocale(const Locale('en', 'US')),
            child: Text('english'.tr),
          ),
          OutlinedButton(
            onPressed: () => Get.updateLocale(const Locale('vn', 'VI')),
            child: Text('vietNam'.tr),
          ),
        ],
      ),
    );
  }
}
