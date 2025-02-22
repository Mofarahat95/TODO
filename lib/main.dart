import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/routes_manager/routes_manager.dart';
import 'package:todo/config/theme/my_theme.dart';
import 'package:todo/config/todo_app.dart';
import 'package:todo/features/auth/provider/user_provider.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';
import 'package:todo/features/tasks/presentation/providers/date_picker_provider.dart';

import 'features/auth/firebase/firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      saveLocale: true,
      path: 'lib/config/language',
      child: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsProvider()..getTheme(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ], child: const TodoApp()),
    ),
  );
}
