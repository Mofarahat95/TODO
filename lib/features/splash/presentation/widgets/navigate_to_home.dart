
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/routes_manager/routes.dart';

void navigateTo(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 3),
        () {
      GoRouter.of(context).pushReplacement(AppRoutes.signUpRoute);
    },
  );
}
