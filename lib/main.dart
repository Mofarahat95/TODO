import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/config/routes_manager/routes_mansger.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.Routes,
    );
  }
}
