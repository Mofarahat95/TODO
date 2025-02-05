import 'package:flutter/cupertino.dart';
import 'package:todo/features/settings/presentation/screens/settings_screen.dart';
import 'package:todo/features/tasks/presentation/screens/tasks_screen.dart';

class TabsProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List<Widget> tabs = [
    TasksScreen(),
    SettingsScreen(),
  ];
  changeTabs({required int value}){
    selectedIndex=value;
    notifyListeners();
  }

}