import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/routes_manager/routes_manager.dart';
import 'package:todo/config/theme/my_theme.dart';
import 'package:todo/features/settings/presentation/provider/settings_provider.dart';

import 'firebase_options.dart';

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
      child: ChangeNotifierProvider(
          create: (context) => SettingsProvider()..getTheme(),
          child: const todo()),
    ),
  );
}

class todo extends StatelessWidget {
  const todo({super.key});

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
