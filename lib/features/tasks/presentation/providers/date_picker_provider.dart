import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';

class DatePickerProvider extends ChangeNotifier {
  DateTime? selectedDate = DateTime.now();

  CustomDatePicker(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      notifyListeners();
    }
  }
}
