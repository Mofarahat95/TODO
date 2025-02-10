import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import '../provider/settings_provider.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: AppSize.s10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language'.tr(),
            style: poppins16().copyWith(
                color: pro.selectedTheme == ThemeMode.dark
                    ? AppColors.whiteColor
                    : AppColors.blackColor),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: pro.selectedTheme == ThemeMode.dark
                    ? AppColors.transparentColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primaryColor)),
            child: DropdownButtonFormField<String>(
                dropdownColor: pro.selectedTheme == ThemeMode.light
                    ? AppColors.whiteColor
                    : AppColors.secondryDarkColor,
                padding: EdgeInsets.only(left: 10),
                value: pro.selectedLang.toString(),
                items: pro.language.map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(
                      lang,
                      style: inter18().copyWith(
                          color: pro.selectedTheme == ThemeMode.dark
                              ? AppColors.primaryColor
                              : null),
                    ),
                  );
                }).toList(),
                iconEnabledColor: AppColors.primaryColor,
                onChanged: (value) {
                  pro.changeLangauge(value!, context);
                }),
          ),
        ],
      ),
    );
  }
}
