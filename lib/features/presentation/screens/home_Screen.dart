import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/features/presentation/screens/taps/settings_tab.dart';
import 'package:todo/features/presentation/screens/taps/tasks_tab.dart';
import 'package:todo/features/presentation/widgets/addTask_Bottomsheet.dart';
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> Taps = [
    TasksTab(),
    SettingsTabs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      body: Taps[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          showModalBottomSheet(
            isDismissible: true,
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskBottomSheet(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.whiteColor,
        elevation: 0,
        padding: EdgeInsets.zero,
        notchMargin: 15,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.grayColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_bulleted, size: 30), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: ''),
            ]),
      ),
    );
  }
}
