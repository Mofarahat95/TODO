import 'package:flutter/cupertino.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/tasks/presentation/widgets/calnder_widget.dart';
import 'package:todo/features/tasks/presentation/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment(0, 4),
          children: [
            Container(
              height: AppSize.s30 * 4,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
            ),
            CalenderWidget(),
          ],
        ),
        const SizedBox(
          height: AppSize.s22,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => TaskCard(),
            itemCount: 20,
            padding: EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
          ),
        )
      ],
    );
  }
}
