import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/presentation/widgets/CustomSlidable.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingsProvider>(context);
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s18),
          color: pro.selectedTheme == ThemeMode.light
              ? AppColors.whiteColor
              : AppColors.secondryDarkColor,
        ),
        width: MediaQuery.sizeOf(context).width * .88,
        height: MediaQuery.sizeOf(context).height * .130,
        child: CustomSlidable(
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              const VerticalDivider(),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Name',
                    style: poppins20().copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                      Text('10:44 AM'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ));
  }
}
