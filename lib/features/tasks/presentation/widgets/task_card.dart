import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/fonts_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/data/task_model.dart';
import 'package:todo/features/tasks/presentation/widgets/CustomSlidable.dart';
import 'package:todo/features/tasks/firebase/firebase_task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({required this.model, super.key});

  final TaskModel model;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
          onDelete: (context) {
            FirebaseFunctions.deleteTask(widget.model.id);
          },
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
                    widget.model.title,
                    style: poppins20().copyWith(
                      color: widget.model.isDone
                          ? AppColors.greenColor
                          : AppColors.primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: pro.selectedTheme == ThemeMode.light
                            ? AppColors.iconColor
                            : AppColors.whiteColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: AppSize.s4,
                      ),
                      Text(
                        widget.model.description,
                        style: inter14().copyWith(
                          fontSize: FontSize.s12,
                          color: pro.selectedTheme == ThemeMode.light
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: widget.model.isDone
                          ? AppColors.greenColor
                          : AppColors.primaryColor),
                  onPressed: () {
                    widget.model.isDone = true;
                    FirebaseFunctions.updateTask(widget.model);
                    setState(() {});
                  },
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
