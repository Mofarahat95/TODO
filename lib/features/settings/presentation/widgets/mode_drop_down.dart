import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';

import '../provider/settings_provider.dart';

class ModeDropDown extends StatelessWidget {
  const ModeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingsProvider>(context);
    var currentTheme=pro.selectedTheme==ThemeMode.light?'light':'dark';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: AppSize.s10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Mode'.tr(),
            style: poppins16().copyWith(
                color: pro.selectedTheme==ThemeMode.dark ?
                AppColors.whiteColor : AppColors.blackColor),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: pro.selectedTheme==ThemeMode.light ?
            AppColors.whiteColor : null,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: AppColors.primaryColor)),
            child: DropdownButtonFormField<String>(
              dropdownColor: pro.selectedTheme == ThemeMode.light
                  ? AppColors.whiteColor
                  : AppColors.secondryDarkColor,
              padding: EdgeInsets.symmetric(horizontal: 10),
              value: currentTheme,
              items: pro.theme.map((theme) {
                return DropdownMenuItem(
                  value: theme.toString(),
                  child: Text(theme,style: inter18().copyWith(
                      color: pro.selectedTheme == ThemeMode.dark
                          ? AppColors.primaryColor
                          : null,
                  ),),
                );
              }).toList(),
              iconEnabledColor: AppColors.primaryColor,
              decoration: InputDecoration(
                iconColor: AppColors.primaryColor,
              ),
              onChanged: (value) {
                  pro.changeTheme(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}