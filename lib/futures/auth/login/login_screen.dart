import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/core/controllers/language_controller_extension.dart';
import 'package:flutter_getx_base/core/controllers/theme_controller_extension.dart';
import 'package:get/get.dart';

import '../../../commons/utils/styles/app_text_style.dart';
import '../../../core/controllers/app_controller.dart';
import '../../../data/models/enum/language_type.dart';
import '../../../data/models/enum/theme_type.dart';
import '../../../widgets/button.dart';
import '../../../widgets/icon/leading_icon.dart';
import '../../../widgets/screen_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = AppController.to;
    return ScreenLayout(
      actions: const [
        LeadingIcon(),
      ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'theme'.tr,
                style: const AppTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(
                () => CupertinoSwitch(
                  value: appController.theme.value == ThemeType.light,
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
            icon: const Icon(
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
          const SizedBox(height: 15),
          Button(
            title: 'Click here',
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
