import 'package:flutter/material.dart';
import 'package:todo/config/routes_managers/routes.dart';
import 'package:todo/features/presentation/screens/home_Screen.dart';
import 'package:todo/features/presentation/screens/login_Screen.dart';
import 'package:todo/features/presentation/screens/signUp_Screen.dart';

class RouteGenrator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
