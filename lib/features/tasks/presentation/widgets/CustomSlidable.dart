import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable(
      {required this.child, this.onDelete, this.onEdit, super.key});
  final Widget child;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;
  @override
  Widget build(BuildContext context) {
    return Slidable(
        child: child,
        startActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s18),
              bottomLeft: Radius.circular(AppSize.s18),
            ),
            onPressed: onDelete,
            backgroundColor: AppColors.redColor,
            foregroundColor: AppColors.whiteColor,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            icon: Icons.share,
            label: 'Edite',
          ),
        ]));
  }
}
