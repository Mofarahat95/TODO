import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/config/routes_manager/routes_manager.dart';
import 'package:todo/config/theme/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MyTheme.lihgt,
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.Routes,
    );
  }
}
