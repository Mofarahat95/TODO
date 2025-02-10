import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/fonts_manager.dart';
import 'package:todo/core/utils/strings_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/presentation/providers/date_picker_provider.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DatePickerProvider(),
        builder: (context, child) {
          var pro = Provider.of<DatePickerProvider>(context);
          var settingsPro = Provider.of<SettingsProvider>(context);
          return Container(
            color: settingsPro.selectedTheme == ThemeMode.light
                ? AppColors.whiteColor
                : AppColors.secondryDarkColor,
            height: MediaQuery.sizeOf(context).height * AppSize.s0_5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s20,
                vertical: AppSize.s10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    AppStrings.addTask,
                    style: poppins18().copyWith(
                        color: settingsPro.selectedTheme == ThemeMode.light
                            ? AppColors.blackColor
                            : null),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: AppStrings.taskHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s16),
                        )),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: AppStrings.descrpitionkHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s16),
                        )),
                  ),
                  Text(
                    AppStrings.selecetDate,
                    style: inter20().copyWith(
                      color: settingsPro.selectedTheme == ThemeMode.dark
                    ? AppColors.whiteColor
                        : null
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pro.CustomDatePicker(context);
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      pro.selectedDate.toString().substring(0, 10),
                      style: inter18().copyWith(
                          color: settingsPro.selectedTheme == ThemeMode.dark
                              ? AppColors.whiteColor
                              : null
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Done',
                      style: poppins18(),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
