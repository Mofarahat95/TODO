import 'package:flutter/material.dart';

class DatePickerProvider extends ChangeNotifier {
  DateTime selectedDatePicker = DateTime.now();
  DateTime selectedDateCalender = DateTime.now();

   changeDateCalender(DateTime date) {
    selectedDateCalender = date;
    print(date);
    notifyListeners();
  }

  CustomDatePicker(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDatePicker = chosenDate;
      notifyListeners();
    }
    ;
  }
}
