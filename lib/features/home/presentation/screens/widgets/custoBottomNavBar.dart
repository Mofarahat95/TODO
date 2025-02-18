import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/home/presentation/provider/tabs_provider.dart';

BottomNavigationBar CustomBottomNavigationBar(TabsProvider pro) {
  return BottomNavigationBar(
    iconSize: AppSize.s30,
    currentIndex: pro.selectedIndex,
    onTap: (index) {
      pro.changeTabs(value: index);
    },
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.auto_awesome_mosaic_outlined),
        label: 'Tasks'.tr(),
        backgroundColor: AppColors.transparentColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'.tr(),
        backgroundColor: AppColors.transparentColor,
      ),
    ],
  );
}
