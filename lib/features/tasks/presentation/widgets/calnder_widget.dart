import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/presentation/providers/date_picker_provider.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingsProvider>(context);
    var datePro = Provider.of<DatePickerProvider>(context);
    return CalendarTimeline(
      initialDate: datePro.selectedDateCalender,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      onDateSelected: (date) {
        datePro.changeDateCalender(date);
      },
      leftMargin: AppMargin.m8,
      monthColor: AppColors.whiteColor,
      dayColor: Colors.white,
      activeDayColor: pro.selectedTheme == ThemeMode.light
          ? AppColors.blackColor
          : AppColors.whiteColor,
      activeBackgroundDayColor: pro.selectedTheme == ThemeMode.light
          ? AppColors.whiteColor
          : AppColors.secondryDarkColor,
    );
  }
}
