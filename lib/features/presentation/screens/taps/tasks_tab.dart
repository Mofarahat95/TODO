import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/presentation/screens/cards/task_card.dart';
import 'package:todo/firebase_functions.dart';
import '../../../../core/utils/app_colors.dart';
class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Tasks',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {});
            },
            leftMargin: 10,
            monthColor: Colors.black,
            dayColor: AppColors.primaryColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primaryColor,
            dotColor: Colors.white,
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),
          StreamBuilder(
              stream: FirebaseFunctions.getTask(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                if (snapshot.hasError) return Text('Error');
                var tasks = snapshot.data?.docs.map((e) => e.data()).toList();
                if (tasks?.isEmpty ?? true)
                  return Text(
                    'No Tasks',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  );
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) => TaskCard(
                      model: tasks[index],
                    ),
                    itemCount: tasks!.length,
                  ),
                );
              })
        ],
      ),
    );
  }
}
