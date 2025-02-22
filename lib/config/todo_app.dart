import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/routes_manager/routes_manager.dart';
import 'package:todo/config/theme/my_theme.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingsProvider>(context);
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: pro.selectedTheme,
      theme: MyTheme.lihgt,
      darkTheme: MyTheme.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.Routes,
    );
  }
}
