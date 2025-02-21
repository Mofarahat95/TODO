import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/routes_manager/routes.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/features/auth/provider/user_provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 140.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.redColor,
        ),
        onPressed: () {
          FirebaseAuth.instance.signOut();
          GoRouter.of(context).go(AppRoutes.loginRoute);
        },
        child: Container(
          child: Text(
            'Logout',
            style: poppins18(),
          ),
        ),
      ),
    );
  }
}
