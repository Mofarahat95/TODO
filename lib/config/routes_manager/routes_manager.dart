import 'package:go_router/go_router.dart';
import 'package:todo/config/routes_manager/routes.dart';
import 'package:todo/features/home/presentation/screens/home_screen.dart';
import 'package:todo/features/settings/presentation/screens/settings_screen.dart';
import 'package:todo/features/splash/presentation/screens/splash_screen.dart';

abstract class RoutesManager {
  static final GoRouter Routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splashRoute,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeRoute,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.settingsRoute,
        builder: (context, state) => SettingsScreen(),
      ),
    ],
  );
}
