import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_time_flutter/widgets/introduction_screen.dart';

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
    return MaterialApp(
      title: 'Popcorn Time',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Estedad'),
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
