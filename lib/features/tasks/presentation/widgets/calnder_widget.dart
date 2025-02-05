import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';

class CalenderWidget extends StatelessWidget {
  CalenderWidget({super.key});
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime(2026, 11, 20).add(Duration(days: 365)),
      onDateSelected: (date) {
        selectedDate = date;
      },
      leftMargin: AppMargin.m8,
      monthColor: AppColors.whiteColor,
      dayColor: Colors.white,
      activeDayColor: AppColors.blackColor,
      activeBackgroundDayColor: AppColors.whiteColor,
      locale: 'en_ISO',
    );
  }
}
