// import 'package:calendar_timeline/calendar_timeline.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:todo/features/presentation/screens/taps/tasks_tab.dart';
//
// import '../../../core/utils/app_colors.dart';
//
// class CalendarView extends StatefulWidget {
//   const CalendarView({super.key});
//   @override
//   State<CalendarView> createState() => _CalendarViewState();
// }
// class _CalendarViewState extends State<CalendarView> {
//    DateTime selectedDate=DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return CalendarTimeline(
//       initialDate: selectedDate,
//       firstDate: DateTime.now().subtract(Duration(days: 365)),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//       onDateSelected: (date) {
//         TasksTab.selectedDate=date;
//         setState(() {});
//       },
//       leftMargin: 10,
//       monthColor: Colors.black,
//       dayColor: AppColors.primaryColor,
//       activeDayColor: Colors.white,
//       activeBackgroundDayColor: AppColors.primaryColor,
//       dotColor: Colors.white,
//       selectableDayPredicate: (date) => date.day != 23,
//       locale: 'en',
//     );
//   }
// }
