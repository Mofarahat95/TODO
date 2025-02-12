import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/presentation/providers/date_picker_provider.dart';
import 'package:todo/firebase_functions.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingsProvider>(context);
    var proDate = Provider.of<DatePickerProvider>(context);
    return CalendarTimeline(
      initialDate: proDate.selectedDateCalender,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime(2026, 11, 20).add(Duration(days: 365)),
      onDateSelected: (date) {
        proDate.changeDateCalender(date);
        print(proDate.selectedDateCalender);
        setState(() {});
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
