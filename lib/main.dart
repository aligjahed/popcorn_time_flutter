import 'package:flutter/material.dart';

import 'db/database.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  try {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
        .build();

    runApp(const MyApp());
  }catch (on , stacktrace){
    throw new Exception(stacktrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
