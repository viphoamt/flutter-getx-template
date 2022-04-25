import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/utils/styles/app_text_style.dart';
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
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: controller.getWeather,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Get.theme.backgroundColor),
                ),
                child: Center(
                  child: Text(
                    'language'.tr,
                    style: AppTextStyle(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'theme'.tr,
                  style: AppTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoSwitch(
                  value: themeController.currentTheme == 'light',
                  onChanged: (value) {
                    themeController.isDarkModeOn;
                    themeController.setThemeMode(value ? 'light' : 'dark');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
