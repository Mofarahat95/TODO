import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/routes_manager/routes.dart';
import 'package:todo/features/auth/provider/user_provider.dart';

void navigateTo(BuildContext context) {
  var userProvider = Provider.of<UserProvider>(context);
  Future.delayed(
    const Duration(seconds: 3),
    () {
       userProvider.firebaseUser == null
          ? GoRouter.of(context).pushReplacement(AppRoutes.loginRoute)
          : GoRouter.of(context).pushReplacement(AppRoutes.homeRoute);
    },
  );
}
