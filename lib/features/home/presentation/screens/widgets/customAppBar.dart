import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/strings_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title,super.key});
 final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: AppPading.p18),
      height: context.screenHeight*.23,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: Text(
          title.tr(),
          style: poppins22().copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),

    );
  }
}
