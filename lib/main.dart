import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_time_flutter/screens/introduction_screen/introduction_screen.dart';

import 'db/database.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  try {
    final database =
        await $FloorAppDatabase.databaseBuilder('popcorn_time.db').build();

    runApp(
      EasyLocalization(
        supportedLocales: [Locale('en'), Locale('fa')],
        path: 'lib/assets/translations',
        child: const MyApp(),
      ),
    );
  } catch (on, stacktrace) {
    throw new Exception(stacktrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Popcorn Time',
      theme: FluentThemeData(fontFamily: 'Estedad'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CostumeIntroductionScreen();
  }
}
