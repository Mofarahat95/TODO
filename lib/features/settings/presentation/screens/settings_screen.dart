import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/widgets/language_drop_down.dart';
import 'package:todo/features/settings/presentation/widgets/mode_drop_down.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSize.s20,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          color: AppColors.primaryColor,
        ),

        LanguageDropDown(),

        ModeDropDown(),

      ],
    );
  }
}
