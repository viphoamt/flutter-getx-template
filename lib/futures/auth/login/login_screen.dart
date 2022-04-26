import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/utils/styles/app_text_style.dart';
import 'package:flutter_getx_base/core/controllers/app_controller.dart';
import 'package:flutter_getx_base/core/controllers/language_controller_extension.dart';
import 'package:flutter_getx_base/core/controllers/theme_controller_extension.dart';
import 'package:flutter_getx_base/futures/auth/login/login_controller.dart';
import 'package:flutter_getx_base/models/enum/language_type.dart';
import 'package:flutter_getx_base/models/enum/theme_type.dart';
import 'package:flutter_getx_base/widgets/button.dart';
import 'package:flutter_getx_base/widgets/icon/leading_icon.dart';
import 'package:flutter_getx_base/widgets/screen_layout.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.to;
    final appController = AppController.to;
    return ScreenLayout(
      actions: const [
        LeadingIcon(),
      ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            title: 'language'.tr,
            onPressed: controller.getWeather,
            width: 150.0,
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
              Obx(
                () => CupertinoSwitch(
                  value: appController.theme == ThemeType.light,
                  onChanged: (value) {
                    appController.isDarkModeOn;
                    appController
                        .setThemeMode(value ? ThemeType.light : ThemeType.dark);
                  },
                ),
              ),
            ],
          ),
          DropdownButton<LanguageType>(
            value: appController.languageCode.value,
            icon: Icon(
              Icons.arrow_drop_down_sharp,
            ),
            items: LanguageType.values
                .map<DropdownMenuItem<LanguageType>>((LanguageType value) {
              return DropdownMenuItem<LanguageType>(
                value: value,
                child: Text(value.translatedName),
              );
            }).toList(),
            onChanged: appController.changeLocale,
          ),
          SizedBox(height: 15),
          Button(
            title: 'Click here',
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
