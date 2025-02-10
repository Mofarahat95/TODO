import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/values_manager.dart';
import 'package:todo/features/home/presentation/provider/tabs_provider.dart';
import 'package:todo/features/home/presentation/screens/widgets/custoBottomNavBar.dart';
import 'package:todo/features/tasks/presentation/widgets/add_task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TabsProvider(),
        builder: (context, child) {
          var pro = Provider.of<TabsProvider>(context);
          return Scaffold(
            extendBody: true,
            body: pro.tabs[pro.selectedIndex],
            bottomNavigationBar: BottomAppBar(
                notchMargin: AppSize.s9,
                padding: EdgeInsets.zero,
                color: AppColors.primaryColor,
                shape: CircularNotchedRectangle(),
                child: CustomBottomNavigationBar(pro)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskWidget(),
                );
              },
              child: Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
            ),
          );
        });
  }
}
