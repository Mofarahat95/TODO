import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/strings_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/home/presentation/screens/widgets/customAppBar.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/presentation/providers/date_picker_provider.dart';
import 'package:todo/features/tasks/presentation/widgets/calnder_widget.dart';
import 'package:todo/features/tasks/presentation/widgets/task_card.dart';
import 'package:todo/features/tasks/firebase/firebase_task.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DatePickerProvider(),
      child: Builder(
        builder: (context) {
          var pro = Provider.of<DatePickerProvider>(context);
          var settingsPro = Provider.of<SettingsProvider>(context);

          return Column(
            children: [
              Stack(
                alignment: Alignment(0, 1.3),
                children: [
                  CustomAppBar(title: AppStrings.appName),
                  CalenderWidget(),
                ],
              ),
              const SizedBox(
                height: AppSize.s22,
              ),
              StreamBuilder(
                stream: FirebaseFunctions.getTasks(pro.selectedDateCalender),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error',
                        style: inter18(),
                      ),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        'No Tasks',
                        style: inter18().copyWith(
                          color: settingsPro.selectedTheme == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  } else {
                    var tasks =
                        snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => TaskCard(
                          model: tasks[index],
                        ),
                        itemCount: tasks.length,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}
