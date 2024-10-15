import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/config/routes_managers/route_genrator.dart';
import 'package:todo/features/domain/entities/taskmodel.dart';
import 'package:todo/firebase_functions.dart';
import '../../../../core/utils/app_colors.dart';

class TaskCard extends StatelessWidget {
  TaskCard({super.key, required this.model});
  TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 115,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Slidable(
            startActionPane: ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  onPressed: (context) {
                    FirebaseFunctions.deleteTask(model.id);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                  autoClose: true,
                ),
                SlidableAction(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  onPressed: (context) {
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const VerticalDivider(
                  color: AppColors.primaryColor,
                  thickness: 3.5,
                  endIndent: 22,
                  indent: 22,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: model.isDone == false
                              ? AppColors.primaryColor
                              : Colors.green),
                    ),
                    Row(
                      children: [
                        Icon(Icons.explore_outlined),
                        Text('${model.date}'),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                model.isDone == true
                    ? const Text(
                        'Done!',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            )),
                        onPressed: () {
                          model.isDone = true;
                          FirebaseFunctions.updateTask(model);
                        },
                        child: const Icon(
                          Icons.done_rounded,
                          color: AppColors.whiteColor,
                          size: 30,
                        ),
                      ),
                SizedBox(width: 10,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
