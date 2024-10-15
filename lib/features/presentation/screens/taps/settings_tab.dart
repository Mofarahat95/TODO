import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

@RoutePage()
class SettingsTabs extends StatelessWidget {
  const SettingsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
