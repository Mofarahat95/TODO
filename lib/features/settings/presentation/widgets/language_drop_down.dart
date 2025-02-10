
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
    var pro =  Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: AppSize.s10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: poppins16().copyWith(color: AppColors.blackColor),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primaryColor)),
            child: DropdownButtonFormField<String>(
                padding: EdgeInsets.only(left: 10),
                value: pro.selectedLang.toString(),
                items: pro.language.map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                iconEnabledColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  iconColor: AppColors.primaryColor,
                ),
                onChanged: (value) {
                  pro.changeLangauge(value!, context);
                }),
          ),
        ],
      ),
    );
  }
}
