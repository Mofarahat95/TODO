import 'package:flutter/material.dart';
import 'package:todo/features/domain/entities/taskmodel.dart';
import 'package:todo/firebase_functions.dart';

import '../../../core/utils/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var descrepController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintStyle: TextStyle(color: AppColors.grayColor),
              ),
            ),
            TextField(
              controller: descrepController,
              decoration: InputDecoration(
                labelText: 'Descreption',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintStyle: TextStyle(color: AppColors.grayColor),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select time',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                chooseYouerDate();
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  fixedSize: Size(350, 35)),
              onPressed: () {
                TaskModel model = TaskModel(
                    title: titleController.text,
                    descreption: descrepController.text,
                    date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,);
                FirebaseFunctions.addTask(model);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  chooseYouerDate() async {
    DateTime? chosenDate = await showDatePicker(
      initialDate: selectedDate,
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) selectedDate = chosenDate;
    setState(() {});
  }
}
