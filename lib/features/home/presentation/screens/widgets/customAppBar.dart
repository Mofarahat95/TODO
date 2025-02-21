import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/strings_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/auth/provider/user_provider.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({title,super.key});
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<UserProvider>(context);
    return Container(
      padding: EdgeInsets.only(bottom: AppPading.p18),
      height: context.screenHeight*.23,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: Text(
          pro.userModel!.name,
          style: poppins22().copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),

    );
  }
}
